class CreateQuotes < ActiveRecord::Migration
  def change
    create_table :quotes do |t|
    	t.string	:author
    	t.text		:quote
    	t.text		:image_url

      t.timestamps
    end
  end
end
