class UpdateCreateUser < ActiveRecord::Migration[5.1]
  def change
  
      change_column_null :shortened_urls, :short_url, false
   
      add_index :shortened_urls, :short_url, unique: true  
  end
end
