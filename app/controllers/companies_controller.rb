class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]
  def index
    if params[:query].present?
      @companies = Company.where("name ILIKE?", "%#{params[:query]}%")
    else
      @companies = Company.all
    end
  end

  def show
    @reviews = @company.reviews.order("updated_at DESC")[0, 3]
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end
end
