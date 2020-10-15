class ReviewsController < ApplicationController
  before_action :find_podcast
  def new
    @review = Review.new
  end

  def create
    @review = Review.new(review_params)
    @review.podcast = Podcast.find(params[:podcast_id])
    @review.user = current_user

    if @review.save
      redirect_to podcast_path(@podcast)
    else
      flash[:alert] = "Something went wrong."
      render :new
    end
  end

  def edit
    @review = Review.find(params[:id])
  end

  def update
    @review = Review.find(params[:id])

    if @review.update(review_params)
    end
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content)
  end

  def find_podcast
    @podcast = Podcast.find(params[:podcast_id])
  end
end
