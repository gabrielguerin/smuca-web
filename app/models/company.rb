# frozen_string_literal: true

class Company < ApplicationRecord
  # Associations
  has_many :contacts
end
