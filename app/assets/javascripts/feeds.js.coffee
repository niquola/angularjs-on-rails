window.FeedsCnt = ($scope, $http, $resource)->
  feeds = $resource '/feeds/:collection:id/:member',{id: '@id', collection: '@collection', member: '@member', format: 'json'},
    'get':    {method:'GET'},
    'save':   {method:'POST'},
    'query':  {method:'GET', isArray:true},
    'preview': {method:'GET', params: {collection: 'preview'}},
    'delete': {method:'DELETE'}

  $scope.search = 'http://feeds2.feedburner.com/Rubyflow'

  $scope.feeds = feeds.query()

  $scope.preview = ()->
    $scope.loading = 'Loading preview...'
    params = {url: $scope.search}
    $scope.feed = feeds.preview params, ->
      $scope.isPreview = true
      $scope.loading = false

  $scope.addFeed = ()->
    $scope.loading = 'Saving feed...'
    params = {url: $scope.feed.feed_url}
    $http.post('/feeds.json', params)
      .success (data)->
        $scope.isPreview = false
        $scope.loading = false
        $scope.feed = data
        $scope.feeds.push(data)

  $scope.removeFeed = ()->
    $scope.loading = 'Removing feed...'
    $scope.feed.$delete ->
      $scope.loading = false
      $scope.feed = null

  $scope.setFeed = (feed)->
    $scope.isPreview = false
    $scope.feed.active = null if $scope.feed
    $scope.feed = feed
    $scope.feed.active = 'active'
    return if feed.entries
    $http.get("/feeds/#{feed.id}.json")
      .success (data)->
        $scope.loading = false
        $scope.feed.entries = data.entries

  #helpers
