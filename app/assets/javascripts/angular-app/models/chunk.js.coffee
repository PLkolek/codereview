angular.module 'app.exampleApp'
.factory 'Chunk', ['Line', (Line)->
  class Chunk
    constructor: (@lines, @old_begin, @old_end, @new_begin, @new_end) ->
    @build: (response) ->
      new Chunk response.lines.map(Line.build),
        response.old_begin,
        response.old_end,
        response.new_begin,
        response.new_end
    prepend: (lines) ->
      @lines = lines.concat(@lines)
      @old_begin-=lines.length
      @new_begin-=lines.length
    prependChunk: (chunk) ->
      @lines = chunk.lines.concat(@lines)
      @old_begin-=chunk.old_end-chunk.old_begin
      @new_begin-=chunk.new_end-chunk.new_begin
]