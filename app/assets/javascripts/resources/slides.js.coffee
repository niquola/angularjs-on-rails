# <% url = AngularOnRails::Application.routes.url_helpers %>
app = window.app
app.factory 'Slide', ($resource)->
  $resource '<%= url.slides_path %>'
