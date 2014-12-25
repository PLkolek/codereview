angular.module('app.exampleApp').directive('crFocusme', ($timeout) ->
  console.log('running')
  scope:
    trigger: '=crFocusme'
  link: (scope, element) ->
    scope.$watch('trigger', (value) ->
        if(value == true)
          element[0].focus()
          scope.trigger = false
    )
)