class ReviewsController < ApplicationController
  before_action :set_company
  before_action :set_review, only: [:show, :edit]

  def index
    @reviews = @company.reviews
  end

  def show
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render new
    end
  end

  def edit
  end

  def update
    @review = Review.new(review_params)
    if @review.save
      redirect_to @review
    else
      render 'edit'
    end
  end

  def destroy
  end
  private
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :user_id, :company_id)
    end
end
