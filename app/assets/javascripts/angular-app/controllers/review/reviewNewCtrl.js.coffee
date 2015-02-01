angular.module('app.exampleApp').controller("ReviewNewCtrl", [
  '$scope',
  'CommitService',
  ($scope, CommitService) ->
    $scope.commits=[]
    $scope.commits.$resolved=true
    $scope.search = (params) ->
      $scope.commits=CommitService.query(params)


])