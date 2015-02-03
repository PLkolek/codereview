angular.module('app.exampleApp').controller("ReviewViewCtrl", [
  '$scope',
  '$routeParams'



  'FileService',
  'ShowMore',
  'Line',
  'CommentService',
  ($scope, $routeParams, FileService, ShowMore, Line, CommentService)->

    $scope.files = FileService.query({review_id: $routeParams.reviewId })
    $scope.input = {}
    $scope.focus = {}
    $scope.showMoreLastHidden = {}
    $scope.addComment = (file, line) ->
      $scope.input[file.name+line.key()] = true
      $scope.focus[file.name+line.key()] = true

    $scope.commentVisible = (file, line)-> line.isCode() && !$scope.input[file.name+line.key()] && line.comment!=''

    #FIXME: hacky mess
    $scope.showMore = (file, chunk) ->
      if(file.chunks[0]==chunk)
        ShowMore.query
            from: 1
            to: chunk.old_begin-1
            old_new_difference: chunk.new_begin-chunk.old_begin
            file_name: file.name
            review_id: $routeParams.reviewId
          ,(res)-> chunk.prepend Line.buildArray(res)
      else
        previousIndex = file.chunks.indexOf(chunk) - 1
        previous = file.chunks[previousIndex];
        ShowMore.query
          from: previous.old_end
          to: chunk.old_begin-1
          old_new_difference: chunk.new_begin-chunk.old_begin
          file_name: file.name
          review_id: $routeParams.reviewId
        ,(res)->
          chunk.prepend Line.buildArray(res)
          chunk.prependChunk previous
          file.chunks.splice(previousIndex, 1)
    $scope.showMoreLast = (file) ->
      $scope.showMoreLastHidden[file.name] = true
      lastChunk = file.chunks[file.chunks.length - 1]
      ShowMore.query
        from: lastChunk.old_end
        to: 9999999
        old_new_difference: lastChunk.new_end-lastChunk.old_end
        file_name: file.name
        review_id: $routeParams.reviewId
      , (res) ->
          lastChunk.append Line.buildArray(res)


    $scope.isShowMoreFirst = (file, chunk) -> file.chunks[0]!=chunk || chunk.old_begin!=1

    $scope.saveComment = (file, line) ->
      $scope.input[file.name+line.key()] = false
      if line.comment!=""
        CommentService.save(
          old_no:   line.old_no
          new_no:   line.new_no
          file_name:file.name
          content:  line.comment
          review_id: $routeParams.reviewId
        )
      else
        CommentService.delete(
          old_no:   line.old_no
          new_no:   line.new_no
          file_name:file.name
          review_id: $routeParams.reviewId
        )
])
