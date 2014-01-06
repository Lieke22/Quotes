class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
    	t.string	:author
    	t.text		:quote
    	t.text		:image_url

      t.timestamps
    end

    add_index :quotes ,:quote, :unique => true
  end
end
