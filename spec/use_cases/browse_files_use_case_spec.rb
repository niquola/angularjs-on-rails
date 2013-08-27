require 'spec_helper'

describe BrowseFilesUseCase do
  subject { BrowseFilesUseCase.new(File.dirname(__FILE__)) }

  example do
    p subject.list
  end
end
