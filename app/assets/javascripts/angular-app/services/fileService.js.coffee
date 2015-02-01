angular.module 'app.exampleApp'
.factory 'FileService',
  [
    '$resource',
    'File'
    ($resource, File) ->
      $resource('files.json', {},
        query:
          method: 'GET'
          isArray: true
          transformResponse: (data) ->
            File.buildArray(angular.fromJson(data))
      )
  ]