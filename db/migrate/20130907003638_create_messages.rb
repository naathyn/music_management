class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.string :department
      t.string :email
      t.string :name
      t.string :subject
      t.text :body
      t.boolean :read, default: false
      t.timestamps
    end
    add_index :messages, :email
    add_index :messages, :name
    add_index :messages, [:email, :name]
  end
end
