
class Quote < ActiveRecord::Base

    validates :author, presence: true, length: { maximum: 150 }
	validates :quote, presence: true, length: { maximum: 300 }, uniqueness: true

	def most_significant_word
      quote.split.map { |quote| quote.gsub(/\W/, '') }.sort_by(&:length)[-1]
    end


end
