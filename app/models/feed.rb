class Feed < ActiveRecord::Base
  attr_accessor :preview
  def self.preview(url)
    Feedzirra::Feed.fetch_and_parse(url)
  end

  def self.create_from_url(url)
    feed = self.new
  end
end
