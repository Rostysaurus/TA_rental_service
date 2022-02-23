class PagesController < ApplicationController
  def home
    @teachers = Teacher.where(rating: 5)
  end

end
