class ResponsesController < ApplicationController
  before_action :set_response, only: [:show, :edit, :update, :destroy]
  before_action :set_company, only: [:new, :edit, :update, :destroy]
  before_action :set_review, only: [:new, :edit, :update, :destroy]
  before_action :authenticate_company!, only: [:new, :create, :edit, :update, :destroy]

  def show
  end

  def new
    @response = Response.new
  end

  def create
    @response = Response.new(response_params)
    @response.company_id = params[:company_id]
    @response.review_id = params[:review_id]
    if @response.save
      redirect_to company_reviews_path(@response.company_id)
    else
      render 'new'
    end
  end

  def edit
  end

  def update
    if @response.update(response_params)
      redirect_to company_review_path(@company, @review)
    else
      render 'edit'
    end
  end

  def destroy
    redirect_to company_review_url(@company, @review) if @response.destroy
  end

  private
  def set_response
    @response = Response.find(params[:id])
  end

  def set_company
    @company = Company.find(params[:company_id])
  end

  def set_review
    @review = Review.find(params[:review_id])
  end

  def response_params
    params.require(:response).permit(:title, :content)
  end

end
