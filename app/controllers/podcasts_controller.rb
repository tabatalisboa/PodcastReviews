class PodcastsController < ApplicationController
  before_action :find_podcast, only: [:show, :edit, :update, :destroy]

  def index
    @podcasts = Podcast.all.order('created_at DESC')
  end

  def show
    # @podcast = Podcast.find(params[:id])
  end

  def new
    @podcast = current_user.podcasts.build
    @categories = Category.all.map { |category| [category.name, categoryid] }
  end

  def create
    @podcast = current_user.podcasts.build(podcast_params)

    if @podcast.save
      redirect_to root_path
    else
      render :new
    end
  end
  def edit
  end

  def update
    if @podcast.update(podcast_params)
      redirect_to podcast_path(@podcast)
    else
      render :edit
    end
  end

  def destroy
    @podcast.destroy
    redirect_to root_path
  end

  private

  def podcast_params
    params.require(:podcast).permit(:title, :description, :author)
  end

  def find_podcast
    @podcast = Podcast.find(params[:id])
  end
end
