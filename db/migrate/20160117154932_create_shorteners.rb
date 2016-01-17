class CreateShorteners < ActiveRecord::Migration
  def change
    create_table :shorteners do |t|
      t.string :url
      t.string :slug

      t.timestamps null: false
    end
  end
end
