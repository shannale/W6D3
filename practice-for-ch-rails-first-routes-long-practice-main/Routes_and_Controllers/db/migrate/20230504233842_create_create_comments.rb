class CreateCreateComments < ActiveRecord::Migration[7.0]
  def change
    create_table :create_comments do |t|
      t.references :author, null: false, foreign_key: {to_table: :users} 
      t.references :artwork, null: false, foreign_key: {to_table: :artworks}
      t.text :body, null: false 

      t.timestamps
    end
  end
end
