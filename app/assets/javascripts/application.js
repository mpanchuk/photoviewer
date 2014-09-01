//= require jquery
//= require jquery_ujs
//= require underscore-min
//= require bootstrap
//= require angular.min
//= require angular-route.min
//= require_tree ./controllers

var photoViewerApp = angular.module('photoViewerApp', [
  'ngRoute',
  'albumsControllers'
]);

photoViewerApp.config(['$routeProvider',
  function($routeProvider) {
    $routeProvider.
      when('/albums', {
        templateUrl: 'assets/albums.html',
        controller: 'AlbumListCtrl'
      }).
      when('/albums/:id', {
        templateUrl: 'assets/photos.html',
        controller: 'AlbumShowCtrl'
      }).
      otherwise({
        redirectTo: '/albums'
      });
  }]);