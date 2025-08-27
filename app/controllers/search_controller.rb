class SearchController < ApplicationController
  def index
    if params[:query].present?
      @jobs = Job.search(
        params[:query],
        includes: [ :company ],
        operator: "or",
        fields: [ "title^5", "company_name^3", "description" ],
        misspellings: { below: 1 },
        match: :word
      )
    else
      @jobs = []
    end
  end
end
