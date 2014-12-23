angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  'File'
  ($scope, File)->
    console.log 'ExampleCtrl running'

    $scope.parts = File.query()

])
