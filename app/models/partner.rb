# frozen_string_literal: true

class Partner < ApplicationRecord
  # User logo with Active Storage

  has_one_attached :logo

  # Add default logo

  after_commit :add_default_logo, on: %i[create update]

  def logo_thumbnail
    if logo.attached?

      logo.variant(resize: '150x150!').processed

    else

      image_url('partners/default_logo.png')

    end
  end

  private

  def add_default_logo
    return if logo.attached?

    logo.attach(
      io: File.open(
        Rails.root.join('app', 'assets', 'images', 'partners', 'default_logo.png')
      ),

      filename: 'default_logo.png',

      content_type: 'image/png'
    )
  end
end
