@exampleApp = angular
  .module('app.exampleApp', [
    'ngResource',
    'ngRoute',
    'templates'
  ])
  .run(->
    console.log 'exampleApp running'
  )
