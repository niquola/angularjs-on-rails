class FilesController < ApplicationController

  def index
    respond_with use_case.list
  end

  def show
    render json: use_case.show(params[:path])
  end

  private

  def use_case
    BrowseFilesUseCase.new(Rails.root.to_s)
  end
end
