appClient.controller('indexClientProductCtrl', function($scope, $http) {

  $http.get('/products.json')
    .success(function(data){
      $scope.products = data.products;
    });

  $scope.goto = function(productId) {
    window.location.href = "/products/" + productId;
  }

});

appClient.controller('showClientProductCtrl', function($scope, $http){
  var pathUrl = window.location.pathname.split('/');
  var productId = pathUrl[2];
  $http.get('/products/' + productId + '.json')
    .success(function(data){
      $scope.product = data.product;
      $scope.product.description = data.product.description;
      console.log($scope.product);
    });
});
