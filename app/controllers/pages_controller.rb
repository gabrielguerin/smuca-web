# frozen_string_literal: true

class PagesController < ApplicationController
  # Layout

  layout 'statics'

  # GET /:page

  def show
    if valid_page?

      render template: params[:page].to_s

    else

      render page: '/public/404', status: :not_found

    end
  end

  private

  # Check if file exists in views/statics

  def valid_page?
    File.exist?(
      Pathname.new(
        Rails.root + "app/views/statics/#{params[:page]}.html.erb"
      )
    )
  end
end
