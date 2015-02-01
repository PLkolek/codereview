angular.module 'app.exampleApp'
.factory 'File', ['Chunk', (Chunk)->
  class File
    constructor: (@name, @chunks) ->
    @build: (response) ->
      new File(response.name, response.chunks.map(Chunk.build))
    @buildArray: (response) ->
      response.map File.build
]