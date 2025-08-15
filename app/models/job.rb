class Job < ApplicationRecord
  belongs_to :company

  searchkick

  def searchdata
    {
      title: title,
      description: description,
      remote: remote,
      company_name: company.name
    }
  end
end
