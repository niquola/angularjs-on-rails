class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    respond_with(items: @feeds)
  end

  def show
    @feed = Feed.find(params[:id])
    respond_with(@feed)
  end

  def create
    @feed = Feed.create(params[:feed])
    respond_with(@feed)
  end
end
