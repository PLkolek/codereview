angular.module 'app.exampleApp'
.factory 'ReviewService',
  [
    '$resource',
    'Review'
    ($resource, Review) ->
      $resource('reviews.json', {},
        query:
          method: 'GET'
          isArray: true
          transformResponse: (data, header) ->
            Review.buildArray(angular.fromJson(data))
        create:
          method: 'POST'
          isArray: false
        delete:
          method: 'DELETE'
          isArray: false
      )
  ]