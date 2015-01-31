angular.module 'app.exampleApp'
.factory 'Review', () ->
  class Review
    constructor: (@name)->
    @build: (response) ->
      new Review(response.name)
    @buildArray: (response) ->
      response.map Review.build