class PodcastsController < ApplicationController
  def index
    @podcasts = Podcast.all.order('created_at DESC')
  end

  def new
    @podcast = Podcast.new
  end

  def create
    @podcast = Podcast.new(podcast_params)

    if @podcast.save
      redirect_to root_path
    else
      render :new
    end
  end

  private
  def podcast_params
    params.require(:podcast).permit(:title, :description, :author)
  end

end
