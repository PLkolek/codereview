angular.module('app.exampleApp').controller("ReviewIndexCtrl", [
  '$scope',
  'ReviewService',
  ($scope, ReviewService) ->
    $scope.reviews = ReviewService.query()
])