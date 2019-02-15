class ReviewsController < ApplicationController
  before_action :set_company
  before_action :set_review, only: [:show, :edit, :update, :destroy]
  before_action :authenticate_user!, only: [:new, :create, :edit, :update]

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
    @review.company_id = params[:company_id]
    @review.user_id = current_user.id
    if @review.save
      compute_rating
      redirect_to company_reviews_path
    else
      render 'new'
    end
  end

  def edit
    authorize @review
  end

  def update
    authorize @review
    if @review.update(review_params)
      redirect_to company_reviews_path
    else
      render 'edit'
    end
  end

  def destroy
    authorize @review
    redirect_to company_reviews_path if @review.destroy
  end

  private
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_review
      @review = Review.find(params[:id])
    end

    def review_params
      params.require(:review).permit(:title, :content, :rating, :company_id)
    end

    def compute_rating
      ratings = @company.reviews.map do |review|
        review.rating
      end
      total = 0
      ratings.each do |rating|
        total += rating
      end
      count = ratings.count
      average = total/count
      @company.update_attribute('rating', average)
    end
end
