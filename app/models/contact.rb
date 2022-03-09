# frozen_string_literal: true

class Contact < ApplicationRecord
  # Associations

  belongs_to :company

  accepts_nested_attributes_for :company

  # Validate associated record for company
  def autosave_associated_records_for_company
    # Find or create the company by name
    self.company = Company.find_or_create_by(name: company.name) unless company.name.blank?
    company.save!
  end
end
