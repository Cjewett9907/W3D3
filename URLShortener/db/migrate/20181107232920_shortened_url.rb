class ShortenedUrl < ActiveRecord::Migration[5.1]
  def change
    create_table :shortened_urls do |t|
      t.string :long_url, unique: true, null: false
      t.string :short_url
      t.integer :user_id, unique: true, null: false
      t.timestamps
    end
    
  end
end
