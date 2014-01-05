require 'net/http'
require 'rubygems'
require 'json'

namespace :quotes do
  desc "Rake task to get quotes data"
  task :fetch => :environment do
    puts "Quote:fetch"
   	res = Net::HTTP.start('www.iheartquotes.com', 80) {|http|
   		http.get('/api/v1/random?source=literature&format=json')
   	}
   
   parsed = JSON.parse(res.body)
   quote_text = parsed["quote"]

   #puts quote_text
   quote_to_add = quote_text[0..quote_text.index('-')-1].strip   
   quote_author = quote_text[quote_text.rindex('--')+2..-1].strip

   #puts quote_author
   #puts quote_add
   @quote = Quote.new(:author => quote_author, :quote => quote_to_add)
   @quote.save
  end
end
