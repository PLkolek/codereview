angular.module 'app.exampleApp'
.factory 'CommitService',
  [
    '$resource',
    'Commit',
    ($resource, Commit) ->
      $resource('commits.json', {},
        query:
          method: 'GET'
          isArray: true
          transformResponse: (data) ->
            Commit.buildArray(angular.fromJson(data))
      )
  ]