var app = angular.module('adminModule', []);

app.controller('indexPageCtrl', function($scope, $http, $location) {
  var request = {
    method: 'get',
    url: '/admin/pages.json'
  }
  $http(request)
    .success(function(data) {
      $scope.pages = data.pages;
      console.log(data);
    });

    $scope.edit = function(pageId){
      window.location.href="/admin/pages/" + pageId + "/edit";
    }

    $scope.remove = function(pageId){
      var r = confirm("Deseja realmente excluir esta página?");
      if (r === true) {
        var reqRemove = {
          type: 'json',
          method: 'delete',
          url: '/admin/pages/' + pageId
        }
        $http(reqRemove)
        .success(function(data, status){
          console.log(data);
          location.reload();
        })
        .error(function(status) {
          console.log(status);
        });
      }
    }
});
