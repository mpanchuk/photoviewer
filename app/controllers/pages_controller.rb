class PagesController < ApplicationController

  skip_before_filter :authenticate_user!, only: :home

  def home
    redirect_to :albums if user_signed_in?
  end

end