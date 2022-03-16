# frozen_string_literal: true

class ChangePhoneToStringFromUsers < ActiveRecord::Migration[7.0]
  change_column :users, :phone, :string
end
