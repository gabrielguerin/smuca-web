# frozen_string_literal: true

class PagesController < ApplicationController
  # GET /:page
  def show
    render template: "/pages/#{params[:page]}"
  end
end
