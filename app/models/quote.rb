class Quote < ActiveRecord::Base

	def most_significant_word
      quote.split.map { |quote| quote.gsub(/\W/, '') }.sort_by(&:length)[-1]
    end
end
