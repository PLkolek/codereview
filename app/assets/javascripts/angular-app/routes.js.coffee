angular.module('app.exampleApp').config(
  ($routeProvider) ->
    $routeProvider
      .when('/reviews',
        templateUrl: 'review/index.html',
        controller: 'ReviewIndexCtrl',
      )
      .otherwise
        redirectTo: '/reviews')

