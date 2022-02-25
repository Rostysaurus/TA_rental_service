class PagesController < ApplicationController
  def home
    @teachers = Teacher.order(rating: :desc).first(5)
  end

end
