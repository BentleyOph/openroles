class Api::V1::JobsController < ApplicationController
  def index
  name_param = params[:company_name] || params[:name]
  company = Company.where('LOWER(name) = ?', name_param.to_s.downcase).first!
    jobs = company.jobs
    render json: jobs, status: :ok
  rescue ActiveRecord::RecordNotFound
    render json: { error: "Company not found" }, status: :not_found
  end
end
