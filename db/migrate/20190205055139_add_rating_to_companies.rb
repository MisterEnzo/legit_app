class AddRatingToCompanies < ActiveRecord::Migration[5.2]
  def change
    add_column :companies, :rating, :float, :default => 1
  end
end
