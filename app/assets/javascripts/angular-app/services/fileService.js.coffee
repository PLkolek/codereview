angular.module 'app.exampleApp'
  .factory 'File',
  [
    '$resource',
    ($resource) ->
      $resource('files.json', {},
        query:
          method: 'GET'
          isArray: true
      )
  ]