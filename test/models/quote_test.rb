require 'test_helper'

class QuoteTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end


  test "Find most significant word" do
  	assert_significant_word('anything', 'If the lessons of history teach us anything')
	assert_significant_word('curiosity','The cure for boredom is curiosity')
	assert_significant_word('discovery','The real voyage of discovery consists not in seeking new lands but seeing with new eyes')
  end

  test "Find most significant when equal length" do
  	assert_significant_word('efgh', 'abcd efgh')
  	assert_significant_word('abcd', 'efgh abcd')
  end

  def assert_significant_word(expectation, quote)
  	assert_equal(expectation, Quote.new(:quote => quote).most_significant_word)
  end
end
