Array.prototype.unique = function() {
  var tmp = {},
    out = [];
  for (var i = 0, n = this.length; i < n; ++i) {
    if (!tmp[this[i]]) {
      tmp[this[i]] = true;
      out.push(this[i]);
    }
  }
  return out;
}

appClient.controller('indexClientProductCtrl', function($scope, $http) {

  $http.get('/products.json')
    .success(function(data) {
      $scope.products = data.products;
    });

  $scope.goto = function(productId) {
    window.location.href = "/products/" + productId;
  }

});

appClient.controller('showClientProductCtrl', ['$scope', '$http', 'CartService', function($scope, $http, CartService) {
  var pathUrl = window.location.pathname.split('/');
  var productId = pathUrl[2];
  $http.get('/products/' + productId + '.json')
    .success(function(data) {
      $scope.product = data.product;
      $scope.product.description = data.product.description;
      console.log($scope.product);
      localStorage.setItem('dados', 'alguma coisa');
    });

  $scope.rating = 5;

  $scope.listagem = CartService.get();

  $scope.addToCart = function(item1) {
    item1 = $scope.product.id;
    CartService.add(item1);
    $scope.listagem = CartService.get();
  }

}]);
