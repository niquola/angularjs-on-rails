# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://jashkenas.github.com/coffee-script/

window.myapp.factory 'Project', ($resource)->
  $resource '/projects/:collection:id/:member',{id: '@id', collection: '@collection', member: '@member', format: 'json'},
    'get':    {method:'GET'},
    'save':   {method:'PUT'},
    'create':   {method:'POST'},
    'query':  {method:'GET', isArray:true},
    'preview': {method:'GET', params: {collection: 'preview'}},
    'delete': {method:'DELETE'}

window.ProjectsCnt = ($scope, Project)->
  $scope.projects = Project.query()

window.ProjectCnt = ($scope, $routeParams, $rootScope, Project)->
  $rootScope.project = Project.get id: $routeParams.id

window.ProjectFormCnt = ($scope, $location, $routeParams, Project)->
  $scope.project = Project.get(id: $routeParams.id) if $routeParams.id
  $scope.submit = ()->
    if $scope.project
      $scope.project.$save ->
        $location.path("/projects")
    else
      Project.create $scope.project, ->
        $location.path("/projects")


