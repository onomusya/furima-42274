class CreateItems < ActiveRecord::Migration[7.1]
  def change
    create_table :items do |t|
      t.string:title
      t.text:content
      t.integer:price
      t.timestamps
    end
  end
end
