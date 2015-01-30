angular.module('app.exampleApp').config(
  ($routeProvider) ->
    $routeProvider
      .when('/example',
        templateUrl: 'file.html',
        controller: 'ExampleCtrl',
      )
      .otherwise
        redirectTo: '/example')

