angular.module 'app.exampleApp'
.factory 'File', ['Line', (Line)->
  class File
    constructor: (@lines) ->
    @build: (response) ->
      new File(response.map(Line.build))
]