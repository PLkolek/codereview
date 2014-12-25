angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  'File'
  ($scope, File)->
    console.log 'ExampleCtrl running'

    $scope.lines = File.query()
    $scope.addComment = () ->
      this.line.inputOpened = true
      this.line.hasFocus = true
    $scope.hide = () ->
      this.line.inputOpened = false
    $scope.commentVisible = ()-> !this.line.inputOpened && this.line.comment!=''
])
