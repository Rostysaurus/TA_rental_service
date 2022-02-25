class ReviewsController < ApplicationController
  before_action :find_teacher, only: [:new, :create]

  def index
    @reviews = Review.all
  end

  def show
    @review = Review.find(params[:id])
  end

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.user = current_user
    @review.teacher = @teacher
    if @review.save
    redirect_to teacher_path(@teacher)
    else
      render :new
    end
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end
end
