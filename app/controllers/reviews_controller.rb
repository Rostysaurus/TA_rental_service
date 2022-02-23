class ReviewsController < ApplicationController
  before_action :find_teacher

  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    # @review.user = current_user
    @review.teacher = @teacher
    @review.save
    redirect_to teacher_path(@teacher)
  end

  private

  def find_teacher
    @teacher = Teacher.find(params[:teacher_id])
  end

  def review_params
    params.require(:review).permit(:comment)
  end

end
