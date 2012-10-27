class StaticPagesController < ApplicationController
  before_filter :current_user
  def home
  end
end
