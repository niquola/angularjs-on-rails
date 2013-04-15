require 'spec_helper'

describe Feed do
  let(:url) {'http://feeds2.feedburner.com/Rubyflow'}

  let(:preview_feed) { Feed.preview(url) }
  let(:feed) { Feed.create_from_url(url) }

  it "should init new" do
    preview_feed.url.should_not be_nil
    preview_feed.title.should_not be_nil

    feed.url.should == preview_feed.url
    feed.title.should == preview_feed.title

    feed.entries.length.should == preview_feed.entries.length
    entry = feed.entries.first
  end
end
