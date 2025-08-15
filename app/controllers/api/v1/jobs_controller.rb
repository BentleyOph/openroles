class Api::V1::JobsController < ApplicationController
  def index
    company = Company.find(params[:company_id])
    jobs = company.jobs
    render json: jobs, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Company not found" }, status: :not_found
  end
end
