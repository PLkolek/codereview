angular.module 'app.exampleApp'
.factory 'Line', () ->
  class Line
    constructor: (@text, @type, @new_no, @old_no, @comment, @from, @to)->
    @build: (response) ->
      new Line(response.text, response.type, response.new_no, response.old_no, response.comment || "", response.from, response.to)
    @buildArray: (response) ->
      response.map Line.build
    isCode: () -> @type!='more'
    hasOldNo: () -> @old_no?
    hasNewNo: () -> @new_no?
    isShowMore: () -> @type=='more'
    key: () -> @old_no + ',' + @new_no
    keyJson: ->
      old_no: @old_no
      new_no: @new_no
    commentJson: ->
      old_no: @old_no
      new_no: @new_no
      content: @comment

