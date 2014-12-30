#FIXME: No internet connection, so instead of adding a method to File service I'm creating new service
angular.module 'app.exampleApp'
.factory 'ShowMore',
  [
    '$resource',
    ($resource) ->
      $resource('files/showMore.json', {},
        query:
          method: 'GET'
          isArray: true
      )
  ]