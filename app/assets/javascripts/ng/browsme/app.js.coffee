#= require angular
#= require angular-resource
#= require angular-animate
#= require angular-route
#= require ../ng-rails/rails
#= require_self
#= require_directory ./services
#= require_directory ./directives
#= require_directory ./resources
#= require_directory ./controllers

configureHttp = (httpp)->
  token= $('meta[name="csrf-token"]').attr('content')
  commonHeaders = httpp.defaults.headers.common
  commonHeaders[ 'X-CSRF-TOKEN' ] = token
  commonHeaders['Accept'] = 'application/json'

app = angular.module('myapp',['ngRoute', 'ngResource', 'ngAnimate'])

app.config ['$httpProvider', ($httpProvider, httpConfig) ->
    configureHttp($httpProvider)
]

app.config ['$routeProvider' , '$locationProvider', ($routeProvider, $locationProvider)->
    $routeProvider
      .when "/files",
        templateUrl: "/files.ng"
        controller: "FilesCnt"
      .otherwise
        templateUrl: "/files/show.ng"
        controller: "FilesShowCnt"

    $locationProvider.html5Mode(true)
]

window.app = app
