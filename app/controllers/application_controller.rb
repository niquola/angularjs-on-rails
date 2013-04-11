class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :intercept_html_requests
  layout nil
  respond_to :json, :html

  private

  def intercept_html_requests
    if request.format == Mime::HTML
      render('layouts/application')
    elsif params[:format] == 'tpl'
      render("/#{params[:controller]}/#{params[:action]}.html.haml", layout: false)
    end
  end
end
