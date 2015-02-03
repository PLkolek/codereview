angular.module('app.exampleApp').config(
  [
    '$routeProvider',
    ($routeProvider) ->
      $routeProvider
        .when('/reviews',
          templateUrl: 'review/index.html',
          controller: 'ReviewIndexCtrl')
        .when('/reviews/new',
          templateUrl: 'review/new.html',
          controller: 'ReviewNewCtrl')
        .when('/reviews/:reviewId',
          templateUrl: 'review/view.html',
          controller: 'ReviewViewCtrl')
        .otherwise
          redirectTo: '/reviews'
  ]
)
