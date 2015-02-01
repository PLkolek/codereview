angular.module('app.exampleApp').controller("ReviewNewCtrl", [
  '$scope',
  'CommitService',
  ($scope, CommitService) ->
    $scope.commits = []
    $scope.commits.$resolved = true
    $scope.search = (params) ->
      $scope.commits = CommitService.query(params)
    $scope.nothingSelected = ->
      for commit in $scope.commits
        return false if commit.selected
      true
    $scope.changeSelect = (commit)->
      commit.selected = !commit.selected
])