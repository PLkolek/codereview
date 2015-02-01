angular.module('app.exampleApp').controller("ReviewNewCtrl", [
  '$scope',
  'CommitService',
  ($scope, CommitService) ->
    $scope.search = (params) ->
      $scope.commits=CommitService.query(params)


])