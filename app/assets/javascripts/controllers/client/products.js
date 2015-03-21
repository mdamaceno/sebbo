appClient.controller('indexClientProductCtrl', function($scope, $http, $location) {

  $scope.products = [];

  $http.get('/products.json')
    .success(function(data){
      $scope.products = data.products;
    });

});