class IssuesController < ApplicationController
  before_filter do
    @project = Project.find(params[:project_id])
  end

  before_filter only: %w[show create destroy] do
    @item = Issue.find_by_id(params[:id])
  end

  def index
    respond_with(@project.issues)
  end

  def show
    respond_with(@project.issues.find(params[:id]))
  end

  def create
    respond_with(@project.issues.create(params[:issue]))
  end

  def update
    @issue = Issue.find(params[:id])
    @issue.update_attributes(params[:issue])
    respond_with(@issue)
  end

  def destroy
    @issue = Issue.find(params[:id])
    @issue.destroy
    respond_with(@issue)
  end
end
