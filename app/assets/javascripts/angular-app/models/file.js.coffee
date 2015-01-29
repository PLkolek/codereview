angular.module 'app.exampleApp'
.factory 'File', ['Chunk', (Chunk)->
  class File
    constructor: (@chunks) ->
    @build: (response) ->
      new File(response.map(Chunk.build))
]