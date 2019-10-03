class Response < ApplicationRecord
  belongs_to :company
  belongs_to :review

  validates :title, presence: true
  validates :content, presence: true
end
