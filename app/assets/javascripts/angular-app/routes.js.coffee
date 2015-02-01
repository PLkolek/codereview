angular.module('app.exampleApp').config(
  ($routeProvider) ->
    $routeProvider
      .when('/reviews',
        templateUrl: 'review/index.html',
        controller: 'ReviewIndexCtrl')
      .when('/reviews/new',
        templateUrl: 'review/new.html',
        controller: 'ReviewNewCtrl')
      .otherwise
        redirectTo: '/reviews')

