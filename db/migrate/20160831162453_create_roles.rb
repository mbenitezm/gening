class CreateRoles < ActiveRecord::Migration
  def change
    create_table :roles do |t|
      t.string :name, limit: 255
      t.timestamps null: false
      t.datetime :deleted_at, index: true
    end
  end
end
