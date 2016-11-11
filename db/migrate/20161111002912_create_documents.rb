class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.integer :part_id
      t.attachment :file
    end
  end
end
