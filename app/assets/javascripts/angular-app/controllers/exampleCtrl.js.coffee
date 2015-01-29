angular.module('app.exampleApp').controller("ExampleCtrl", [
  '$scope',
  'FileService',
  'ShowMore',
  'Line',
  'CommentService',
  ($scope, FileService, ShowMore, Line, CommentService)->
    console.log 'ExampleCtrl running'

    $scope.file = FileService.query()
    $scope.input = {}
    $scope.focus = {}
    $scope.addComment = (line) ->
      $scope.input[line.key()] = true
      $scope.focus[line.key()] = true
    $scope.commentVisible = (line)-> line.isCode() && !$scope.inputOpened(line) && line.comment!=''
    #FIXME: hacky mess
    $scope.showMore = (line) ->
      index = $scope.file.lines.indexOf(line)
      neighbourIndex = if index>0 then index-1 else index+1
      diff = $scope.file.lines[neighbourIndex].new_no-$scope.file.lines[neighbourIndex].old_no
      ShowMore.query({ from: line.from, to: line.to, old_new_difference: diff },
        (res)-> Array.prototype.splice.apply($scope.file.lines, [index, 1].concat(Line.buildArray(res))))

    $scope.saveComment = (line) ->
      $scope.input[line.key()] = false
      if line.comment!=""
        CommentService.save(line.commentJson())
      else
        CommentService.delete(line.keyJson())

    $scope.inputOpened = (line) -> $scope.input[line.key()]
    $scope.hasFocus = (line) -> $scope.focus[line.key()]
])
