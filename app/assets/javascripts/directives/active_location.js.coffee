window.app = app
app.directive 'activetab', ($location)->
  replace: true
  template: '<li ng-class="{active: active}"><a href="{{href}}" ng-transclude></a></li>'
  restrict: 'E'
  transclude: true
  scope: { href: '@' }
  link: (scope, element, attrs)->
    scope.$watch 'href', ->
      if $location.path() == attrs.href
        scope.active = true
