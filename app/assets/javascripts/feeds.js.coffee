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
  $scope.search = 'http://feeds2.feedburner.com/Rubyflow'
  $scope.preview = ()->
    params = {url: $scope.search}
    $scope.feedsLoading = true
    $http.get('/feeds/preview.json', params: params)
      .success (data)->
        $scope.validPreview = true
        $scope.feedsLoading = false
        $scope.feed = data
        console.log(data)

  $scope.loading = false
  $scope.setFeed =(item)->
    $scope.loading = true
    $scope.currentFeed = item
    $http.get("/feeds/#{item.id}.json").success (data)->
      $scope.news = data.news
      $scope.loading = false
      console.log(data.news)

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
