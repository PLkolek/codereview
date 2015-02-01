angular.module 'app.exampleApp'
.factory 'Review', () ->
  class Review
    constructor: (@id, @name)->
    @build: (response) ->
      new Review(response.id, response.name)
    @buildArray: (response) ->
      response.map Review.build