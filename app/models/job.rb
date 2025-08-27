class Job < ApplicationRecord
  belongs_to :company
  searchkick

  def search_data
    attributes.merge(
      company_name: company&.name
    )
  end
end