class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    respond_with(@feeds)
  end

  def show
    @feed = Feed.find(params[:id])
    respond_with(@feed, include: :entries)
  end

  def preview
    @feed = Feed.preview(params[:url])
    respond_with(@feed)
  end

  def create
    @feed = Feed.create_from_url(params[:url])
    respond_with(@feed)
  end

  def destroy
    @feed = Feed.find(params[:id])
    @feed.destroy
    respond_with(@feed)
  end
end
