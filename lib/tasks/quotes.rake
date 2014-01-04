require 'net/http'
require 'rubygems'
require 'json'

namespace :quotes do
  desc "Rake task to get quotes data"
  task :fetch => :environment do
    puts "Quote:fetch"
   	res = Net::HTTP.start('www.iheartquotes.com', 80) {|http|
   		http.get('/api/v1/random?source=codehappy&format=json')
   	}
   
   parsed = JSON.parse(res.body)
   quote_text = parsed["quote"]

   puts quote_text
   #quote_add = quote_text[0..quote_text.index('-')-1].strip
   
   #puts quote_add
   @quote = Quote.new(:quote => quote_text)

   @quote.save


  end
end
