# frozen_string_literal: true

class Contact < ApplicationRecord
  # Associations

  belongs_to :company

  accepts_nested_attributes_for :company
end
