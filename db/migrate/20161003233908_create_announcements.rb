class CreateAnnouncements < ActiveRecord::Migration
  def change
    create_table :announcements do |t|
      t.text :message
      t.integer :company_id, index: true
      t.timestamps null: false
    end
  end
end
