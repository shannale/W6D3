class CreateUserAndEmails < ActiveRecord::Migration[7.0]
  def change
    create_table :user_and_emails do |t|
      t.string :users, null: false
      t.string :emails, null: false 
      t.timestamps
    end
    # add_column :users, :name, :string, null: false 
    # add_column :emails, :name, :string, null: false 
  end
end
