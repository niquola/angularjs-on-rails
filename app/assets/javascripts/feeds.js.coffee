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

window.FeedsFormCnt = ($scope, $http, $location)->
  $scope.newFeed = {name: 'Test', url: 'https://github.com/patcito/angularjs_scaffold'}
  $scope.create = ()->
    $scope.progress = true
    $http.post("/feeds.json", feed: $scope.newFeed)
      .success (data)->
        $scope.progress = false
        $scope.items.push(data)
        $scope.newFeed = {}
        $location.path("/feeds")
      .error (err)->
        consoloe.log(arguments)

