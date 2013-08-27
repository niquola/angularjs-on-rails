#= require angular
#= require angular-resource
#= require_self
#= require_directory ./services
#= require_directory ./directives
#= require_directory ./resources
#= require_directory ./controllers
#= require_directory .

app = angular.module('myapp',['ngResource'])

app.config ['$httpProvider', ($httpProvider) ->
  token= $('meta[name="csrf-token"]').attr('content')
  commonHeaders = $httpProvider.defaults.headers.common
  commonHeaders[ 'X-CSRF-TOKEN' ] = token
  commonHeaders['Accept'] = 'application/json'
]

window.app = app
