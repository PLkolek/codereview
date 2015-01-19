angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  'FileService',
  'ShowMore',
  'Line',
  ($scope, FileService, ShowMore, Line)->
    console.log 'ExampleCtrl running'

    $scope.file = FileService.query()
    $scope.addComment = () ->
      this.line.inputOpened = true
      this.line.hasFocus = true
    $scope.hide = () ->
      this.line.inputOpened = false
    $scope.commentVisible = ()-> this.line.isCode() && !this.line.inputOpened && this.line.comment!=''
    #FIXME: hacky mess
    $scope.showMore = () ->
      index = this.file.lines.indexOf(this.line)
      neighbourIndex = if index>0 then index-1 else index+1
      diff = $scope.file.lines[neighbourIndex].new_no-$scope.file.lines[neighbourIndex].old_no
      ShowMore.query({ from: this.line.from, to: this.line.to, old_new_difference: diff },
        (res)-> Array.prototype.splice.apply($scope.file.lines, [index, 1].concat(Line.buildArray(res))))
])
