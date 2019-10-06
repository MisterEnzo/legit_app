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
      redirect_to company_path(@review.company_id)
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
      redirect_to company_path(@review.company_id)
    else
      render 'edit'
    end
  end

  def destroy
    authorize @review
    redirect_to company_path(@review.company_id) if @review.destroy
  end

  private
    def set_company
      @company = Company.find(params[:company_id])
    end

    def set_review
      if params[:review_id]
        @review = Review.find(params[:review_id])
      else
        @review = Review.find(params[:id])
      end
    end

    def review_params
      params.require(:review).permit(:title, :content, :rating, :image)
    end

end
