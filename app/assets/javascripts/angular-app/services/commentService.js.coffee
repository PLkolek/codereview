angular.module 'app.exampleApp'
.factory 'CommentService',
  [
    '$resource',
    ($resource) ->
      $resource('comments.json', {},
        save:
          method: 'PUT'
          isArray: false
        delete:
          method: 'DELETE'
          isArray: false
      )
  ]