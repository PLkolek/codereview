angular.module('app.exampleApp').controller("ReviewNewCtrl", [
  '$scope',
  '$location',
  'CommitService',
  'ReviewService'
  ($scope, $location, CommitService, ReviewService) ->
    $scope.commits = []
    $scope.commits.$resolved = true

    $scope.search = (params) ->
      $scope.searchedUrl = params.url
      $scope.commits = CommitService.query(params)

    $scope.nothingSelected = ->
      for commit in $scope.commits
        return false if commit.selected
      true

    $scope.changeSelect = (commit)->
      commit.selected = !commit.selected

    $scope.createReview = (name) ->
      reviewId = ReviewService.create(
        url: $scope.searchedUrl
        revisions: $scope.commits.filter((c)->c.selected).map((c)->c.revision[1..-1])
        name: name
      , ->
        $location.path("/reviews/#{reviewId.id}")
      )

])