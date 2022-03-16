# frozen_string_literal: true

class ChangePhoneToStringFromContacts < ActiveRecord::Migration[7.0]
  change_column :contacts, :phone, :string
end
