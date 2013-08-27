class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :intercept_html_requests
  layout nil
  respond_to :json, :html

  private

  def intercept_html_requests
    if params[:format] == 'ng'
      render("/#{params[:controller]}/#{params[:action]}.html.haml", layout: false)
    end
  end
end
