class CompaniesController < ApplicationController
  before_action :set_company, only: [:show]
  def index
    @companies = Company.all
  end

  def show
    @reviews = @company.reviews.order("updated_at DESC")[0, 3]
  end

  private
    def set_company
      @company = Company.find(params[:id])
    end
end
