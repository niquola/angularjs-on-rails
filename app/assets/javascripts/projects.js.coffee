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

window.myapp.controller 'ProjectsCnt', ($state, $scope, Project)->
  $scope.projects = Project.query()

window.myapp.controller 'ProjectCnt', ($state, $scope, Project)->
  $scope.project = Project.get id: $state.params.id

window.myapp.controller 'ProjectFormCnt', ($scope, $state, Project)->
  $scope.project = Project.get(id: $state.params.id) if $state.params.id
  $scope.submit = ()->
    if $scope.project
      $scope.project.$save ->
        $state.transitionTo('projects/:id', id: $scope.project.id)
    else
      Project.create $scope.project, (data)->
        $state.transitionTo('projects/:id', id: data.id)


