require 'spec_helper'

describe Feed do
  it "should init new" do
    @feed = Feed.preview('http://feeds2.feedburner.com/Rubyflow')
    p @feed
  end

end
