#= require angular
#= require angular-resource
#= require ../ng-rails/rails
#= require_self
#= require_directory ./services
#= require_directory ./directives
#= require_directory ./resources
#= require_directory ./controllers
#= require './routes'

configureHttp = (httpp)->
  token= $('meta[name="csrf-token"]').attr('content')
  commonHeaders = httpp.defaults.headers.common
  commonHeaders[ 'X-CSRF-TOKEN' ] = token
  commonHeaders['Accept'] = 'application/json'

app = angular.module('myapp',['ngResource'])

app
  .config ['$httpProvider', ($httpProvider, httpConfig) ->
    configureHttp($httpProvider)
]

window.app = app
