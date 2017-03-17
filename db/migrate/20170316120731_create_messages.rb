class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false
      t.string :messageable_type, null: false
      t.integer :messageable_id, null: false
      t.text :text, null: false
      t.timestamps
    end
    add_index :messages, %i(messageable_type messageable_id)
  end
end
