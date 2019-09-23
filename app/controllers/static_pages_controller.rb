class StaticPagesController < ApplicationController
  def home
    @reviews = Review.all[0..2]
  end

  def about
  end

  def company_home
  end
end
