window.FeedsCnt = ($scope, $http)->
 itemsUrl = "/feeds.json"
 $scope.feedsLoading = false
 $scope.load = ()->
   return if $scope.loading
   $scope.loading = true
   params = {}
   $http.get(itemsUrl, params: params).success (data)->
      $scope.feedsLoading = false
      angular.extend($scope, data)
 $scope.load()

