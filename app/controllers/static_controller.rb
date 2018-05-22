class StaticController < ApplicationController
  skip_before_action :authenticate_admin!, only: [:index, :about]

  def index
  end

  def home
  end

  def contact
  end

  def about
  end
end
