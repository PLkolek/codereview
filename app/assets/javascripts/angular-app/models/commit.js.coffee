angular.module 'app.exampleApp'
.factory 'Commit', () ->
  class Commit
    constructor: (@revision, @author, @title) ->
    @build: (response) ->
      new Commit(response.revision, response.author, response.title)
    @buildArray: (response) ->
      response.map Commit.build