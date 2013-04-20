class ProjectsController < ApplicationController
  before_filter only: [:show, :update, :destroy] do
    @project = Project.find(params[:id])
  end

  def index
    @projects = Project.all
    respond_with(@projects)
  end

  def show
    respond_with(@project)
  end

  def create
    @project = Project.create(params[:project])
    respond_with(@project)
  end

  def update
    @project.update_attributes(params[:project])
    respond_with(@project)
  end

  def destroy
    @project.destroy
    respond_with(@project)
  end
end
