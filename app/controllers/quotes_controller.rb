require 'flickraw'

class QuotesController < ApplicationController
  before_action :set_quote, only: [:show, :edit, :update, :destroy]

  http_basic_authenticate_with name: "admin", password: "secret",
  except: [:random]

  # GET /quotes
  # GET /quotes.json
  def index
    sort_column = params[:key] ? params[:key] : "author"

    puts "using #{sort_column}"
    puts "#{params[:key]}"

    @quotes = Quote.paginate(:page => params[:page], :per_page => 15, :order => "#{sort_column} ASC")
  end

  # GET /quotes/1
  # GET /quotes/1.json
  def show
  end

  # GET /quotes/new
  def new
    @quote = Quote.new
  end

  # GET /quotes/1/edit
  def edit
  end

  # POST /quotes
  # POST /quotes.json
  def create
    @quote = Quote.new(quote_params)

    respond_to do |format|
      if @quote.save
        format.html { redirect_to @quote, notice: 'Quote was successfully created.' }
        format.json { render action: 'show', status: :created, location: @quote }
      else
        format.html { render action: 'new' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /quotes/1
  # PATCH/PUT /quotes/1.json
  def update
    respond_to do |format|
      if @quote.update(quote_params)
        format.html { redirect_to @quote, notice: 'Quote was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: 'edit' }
        format.json { render json: @quote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /quotes/1
  # DELETE /quotes/1.json
  def destroy
    @quote.destroy
    respond_to do |format|
      format.html { redirect_to quotes_url }
      format.json { head :no_content }
    end
  end

  #Gives a random quote
  def random

    @quote = Quote.order("RANDOM()").first

    if @quote.image_url.blank?      
      @quote.image_url = get_flickr_image_url(@quote)
      @quote.save
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_quote
      @quote = Quote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def quote_params
      params.require(:quote).permit(:author, :quote, :image_url)
    end

    def get_flickr_image_url(quote)
      FlickRaw.api_key="def55485efa82e421df715987b30e2a5"
      FlickRaw.shared_secret="828ed35ca85f4b18"

      result = flickr.photos.search(:text => quote.most_significant_word, :per_page => 1, :safe_search => 1, :is_commons => true)

      #Image used in case no result is found
      biggest_url = "http://farm3.staticflickr.com/2862/10835118755_3757dab0a4_h.jpg"

      result.each do |p|
        info = flickr.photos.getInfo(:photo_id => p.id)
        sizes = flickr.photos.getSizes(:photo_id => p.id)
        photo_area = 0
        
        sizes.each do |size|
          calculate_area = size.width.to_f * size.height.to_f
          puts "size of #{size.label} is #{size.width} x #{size.height} : #{size.source}"
          if calculate_area > photo_area
            photo_area = calculate_area
            biggest_url = size.source
          end
        end

        
      end

      return biggest_url

    end  

  end
