var commentsControllers = angular.module('commentsControllers', []);

commentsControllers.controller('CommentsListCtrl', ['$scope', '$http',
  function ($scope, $http) {
    $http.get('comments.json?photo_id=' + $scope.$parent.photo.id).success(function(data) {
      $scope.comments = data;
    });

    $scope.save_comment = function(){
      if ($scope.new_comment != undefined){
        $http.post('comments.json', {body: $scope.new_comment, photo_id: $scope.$parent.photo.id}).success(function(data) {
          $scope.comments.push(data);
          $scope.new_comment = "";
        });
      }
    };
  }]);