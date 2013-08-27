# Place all the behaviors and hooks related to the matching controller here.
# All this logic will automatically be available in application.js.
# You can use CoffeeScript in this file: http://coffeescript.org/
window.app.controller 'FilesCnt', ($scope, File)->
  console.log('here')
  $scope.files = File.query()

window.app.controller 'FilesShowCnt', ($scope, $location, File)->
  id = $location.path().split('/files/')[1]
  $scope.file = File.get(id: id)
