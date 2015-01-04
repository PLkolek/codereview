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
      neighbourIndex = if index>0 then index-1 else index+1
      diff = $scope.lines[neighbourIndex].new_no-$scope.lines[neighbourIndex].old_no
      ShowMore.query({ from: this.line.from, to: this.line.to, old_new_difference: diff },
        (res)-> Array.prototype.splice.apply($scope.lines, [index, 1].concat(res)))
    $scope.hasOldNo = () -> this.line.old_no?
    $scope.hasNewNo = () -> this.line.new_no?
])
