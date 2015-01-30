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
    $scope.isShowMoreLast = true
    $scope.addComment = (line) ->
      $scope.input[line.key()] = true
      $scope.focus[line.key()] = true

    $scope.commentVisible = (line)-> line.isCode() && !$scope.inputOpened(line) && line.comment!=''

    #FIXME: hacky mess
    $scope.showMore = (chunk) ->
      if($scope.file.chunks[0]==chunk)
        ShowMore.query
            from: 1
            to: chunk.old_begin-1
            old_new_difference: chunk.new_begin-chunk.old_begin
          ,(res)-> chunk.prepend Line.buildArray(res)
      else
        previousIndex = $scope.file.chunks.indexOf(chunk) - 1
        previous = $scope.file.chunks[previousIndex];
        ShowMore.query
          from: previous.old_end
          to: chunk.old_begin-1
          old_new_difference: chunk.new_begin-chunk.old_begin
        ,(res)->
          chunk.prepend Line.buildArray(res)
          chunk.prependChunk previous
          $scope.file.chunks.splice(previousIndex, 1)
    $scope.showMoreLast = ->
      $scope.isShowMoreLast = false
      lastChunk = $scope.file.chunks[$scope.file.chunks.length - 1]
      ShowMore.query
        from: lastChunk.old_end
        to: 9999999
        old_new_difference: lastChunk.new_begin-lastChunk.old_begin
      , (res) ->
          lastChunk.append Line.buildArray(res)


    $scope.isShowMoreFirst = (chunk) -> $scope.file.chunks[0]!=chunk || chunk.old_begin!=1

    $scope.saveComment = (line) ->
      $scope.input[line.key()] = false
      if line.comment!=""
        CommentService.save(line.commentJson())
      else
        CommentService.delete(line.keyJson())

    $scope.inputOpened = (line) -> $scope.input[line.key()]
    $scope.hasFocus = (line) -> $scope.focus[line.key()]
])
