angular.module('app.exampleApp').controller("ReviewIndexCtrl", [
  '$scope',
  'ReviewService',
  ($scope, ReviewService) ->
    $scope.reviews = ReviewService.query()
    $scope.delete = (review) ->
      ReviewService.delete(
        review_id: review.id
      )
      $scope.reviews.splice($scope.reviews.indexOf(review), 1)
])