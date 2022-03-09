# frozen_string_literal: true

class PagesController < ApplicationController
  # GET /:page
  def show
    render "/pages/#{params[:page]}"
  end
end
