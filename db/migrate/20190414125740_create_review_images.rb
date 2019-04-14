class CreateReviewImages < ActiveRecord::Migration[5.2]
  def change
    create_table :review_images do |t|
      t.string :photo
      t.references :review, foreign_key: true

      t.timestamps
    end
  end
end
