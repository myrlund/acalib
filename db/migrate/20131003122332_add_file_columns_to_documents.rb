class AddFileColumnsToDocuments < ActiveRecord::Migration
  def up
    add_attachment :documents, :attachment
  end
  def down
    remove_attachment :documents, :attachment
  end
end
