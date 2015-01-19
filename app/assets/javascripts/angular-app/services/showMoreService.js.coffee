#FIXME: No internet connection, so instead of adding a method to File service I'm creating new service
angular.module 'app.exampleApp'
.factory 'ShowMore',
  [
    '$resource',
    'Line'
    ($resource, Line) ->
      $resource('files/showMore.json', {},
        query:
          method: 'POST'
          isArray: true
          transformResponse: (data, header) ->
            Line.buildArray(angular.fromJson(data))
      )
  ]