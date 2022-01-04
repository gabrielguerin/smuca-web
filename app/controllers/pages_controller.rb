# frozen_string_literal: true

class PagesController < ApplicationController
  # Layout
  layout 'pages'

  # GET /:page
  def show
    render template: "/pages/#{params[:page]}" if valid_page?
  end

  private

  # Check if file exists in views/statics

  def valid_page?
    File.exist?(
      Pathname.new(
        Rails.root + "app/views/pages/#{params[:page]}.html.erb"
      )
    )
  end
end
