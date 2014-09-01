var albumsControllers = angular.module('albumsControllers', ['commentsControllers']);

albumsControllers.controller('AlbumListCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('albums.json').success(function(data) {
      $scope.albums = data;
    });
  }]);

albumsControllers.controller('AlbumShowCtrl', ['$scope', '$http', '$routeParams',
  function ($scope, $http, $routeParams) {
    $http.get('albums/' + $routeParams.id + '.json').success(function(data) {
      $scope.photos = data;
      $scope.albumTitle = data[0].album_title;
    });
  }]);