class CreateUsersGroups < ActiveRecord::Migration[5.0]
  def change
    create_table :users_groups do |t|
      t.references :user, null: false
      t.references :group, null: false
      t.integer :status, null: false, default: 0
      t.timestamps
    end
  end
end
