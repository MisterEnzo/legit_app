class ReviewImagesController < ApplicationController
  ## before_action :check_image_count, only: [:create]

  def index
    @review_images = ReviewImage.all
  end

  def new
  end

  def create
    @review_image = ReviewImage.new(review_image_params)
    @review_image.review_id = params[:review_id]
    if @review_image.save
      redirect_to review_path
    else
      render 'new'
    end
  end

  private
    def check_image_count
      if Review.find(params[:review_id]) >= 3
        ## return user review page and send error message
    end

    def review_image_params
      params.require(:review_image).permit(:photo, :review_id)
    end
end
