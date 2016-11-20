class AddBroadcastToAnnouncement < ActiveRecord::Migration
  def change
    add_column :announcements, :broadcast, :boolean, default: false
  end
end
