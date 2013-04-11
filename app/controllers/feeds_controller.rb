class FeedsController < ApplicationController
  def index
    @feeds = Feed.all
    respond_with(items: @feeds)
  end

  def show
  end
end
