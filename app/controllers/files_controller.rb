class FilesController < ApplicationController
  respond_to :json, :html

  def index
    respond_with use_case.list
  end

  def show
    id = params[:id]
    id = "#{id}.#{params[:format]}" if params[:format]
    if request.xhr?
      render json: use_case.show(id)
    else
      render use_case.show(id)
    end
  end

  private

  def use_case
    BrowseFilesUseCase.new(Rails.root.to_s)
  end
end
