class ReviewPolicy < ApplicationPolicy
  def update?
    record.user == user
  end
end