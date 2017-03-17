class CreateMessages < ActiveRecord::Migration[5.0]
  def change
    create_table :messages do |t|
      t.references :user, null: false
      t.references :group, null: false
      t.text :text, null: false
      t.timestamps
    end
  end
end
