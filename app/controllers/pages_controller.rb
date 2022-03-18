# frozen_string_literal: true

class PagesController < ApplicationController
  # GET /:page

  def show
    @users = User.limit(9).order('RANDOM()')

    render params[:page].to_s
  end
end
