# frozen_string_literal: true

class PagesController < ApplicationController
  # Layout
  layout 'pages'

  # GET /:page
  def show
    render template: "/pages/#{params[:page]}"
  end
end
