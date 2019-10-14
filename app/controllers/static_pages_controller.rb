class StaticPagesController < ApplicationController
  def home
    @reviews = Review.all[0..5]
  end

  def about
  end

  def company_home
  end
end
