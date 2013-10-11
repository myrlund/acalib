class CreateDocuments < ActiveRecord::Migration
  def change
    create_table :documents do |t|
      t.string :title
      t.string :author
      t.string :source_url
      t.references :collection, index: true

      t.timestamps
    end
  end
end
