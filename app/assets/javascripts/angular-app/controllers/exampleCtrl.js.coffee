angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  'File',
  'ShowMore'
  ($scope, File, ShowMore)->
    console.log 'ExampleCtrl running'

    $scope.lines = File.query()
    $scope.addComment = () ->
      this.line.inputOpened = true
      this.line.hasFocus = true
    $scope.hide = () ->
      this.line.inputOpened = false
    $scope.commentVisible = ()-> this.isCode() && !this.line.inputOpened && this.line.comment!=''
    $scope.isCode = () -> this.line.type!='more'
    $scope.isShowMore = () -> !this.isCode()
    $scope.showMore = () ->
      index = this.lines.indexOf(this.line)
      ShowMore.query((res)->
        Array.prototype.splice.apply($scope.lines, [index, 1].concat(res)))
    $scope.hasOldNo = () -> this.line.old_no?
    $scope.hasNewNo = () -> this.line.new_no?
])
