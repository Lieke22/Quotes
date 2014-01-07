
class Quote < ActiveRecord::Base

	validates :quote, length: { maximum: 300 }, uniqueness: true

	def most_significant_word
      quote.split.map { |quote| quote.gsub(/\W/, '') }.sort_by(&:length)[-1]
    end


end
