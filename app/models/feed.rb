class Feed < ActiveRecord::Base
  class Entry < ActiveRecord::Base
    self.table_name = "entries"
    belongs_to :feed
  end

  def self.preview(url)
    Feedzirra::Feed.fetch_and_parse(url)
  end

  def self.create_from_url(url)
    preview_feed = self.preview(url)
    attrs = preview_feed.as_json
    entries  = attrs.delete("entries")
    feed = self.create(attrs)
    entries.each do |entry|
      feed.entries.create(entry.as_json)
    end
    feed
  end

  has_many :entries, dependent: :destroy
end
