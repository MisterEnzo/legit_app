class CreateResponses < ActiveRecord::Migration[5.2]
  def change
    create_table :responses do |t|
      t.string :title
      t.text :content
      t.references :company, foreign_key: true
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
