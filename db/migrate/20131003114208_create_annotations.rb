class CreateAnnotations < ActiveRecord::Migration
  def change
    create_table :annotations do |t|
      t.text :content
      t.integer :x
      t.integer :y
      t.references :document, index: true

      t.timestamps
    end
  end
end
