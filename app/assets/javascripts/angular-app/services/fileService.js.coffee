angular.module 'app.exampleApp', ['ngResource']
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