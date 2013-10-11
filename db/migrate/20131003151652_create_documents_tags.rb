class CreateDocumentsTags < ActiveRecord::Migration
  def change
    create_table :documents_tags do |t|
      t.references :document, index: true
      t.references :tag, index: true

      t.timestamps
    end
  end
end
