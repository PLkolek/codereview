angular.module 'app.exampleApp'
.factory 'FileService',
  [
    '$resource',
    'File'
    ($resource, File) ->
      $resource('files.json', {},
        query:
          method: 'GET'
          isArray: false
          transformResponse: (data, header) ->
            File.build(angular.fromJson(data))
      )
  ]