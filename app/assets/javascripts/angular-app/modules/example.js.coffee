@exampleApp = angular
  .module('app.exampleApp', [
    'ngResource'
  ])
  .run(->
    console.log 'exampleApp running'
  )
