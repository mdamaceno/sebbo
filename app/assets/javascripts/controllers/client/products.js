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

appClient.controller('showClientProductCtrl', ['$scope', '$http', '$localStorage', 'CartService', function($scope, $http, $localStorage, CartService) {
  var pathUrl = window.location.pathname.split('/');
  var productId = pathUrl[2];
  $http.get('/products/' + productId + '.json')
    .success(function(data) {
      $scope.product = data.product;
      $scope.product.description = data.product.description;
      console.log($scope.product);
    });

  $scope.rating = 5;

  $scope.addToCart = function() {
    var p = {
      id: $scope.product.id,
      name: $scope.product.name,
      quantity: $scope.product.quantity,
      price: $scope.product.price
    }

    var items = CartService.get() || [];
    var aux = 0;

    items.forEach(function(el) {
      if (el.id == $scope.product.id) {
        aux = 1;
      };
    });

    if (aux != 1) {
      CartService.add(p);
      p = [];
      item = [];
    }
  }

  $scope.removeFromCart = function(item) {
    CartService.remove(item);
    console.log('pressionado');
  }

  $scope.delete = function(item) {
    var items = JSON.parse(localStorage.getItem('Cart'));

    var aux = 0;
    var auxIndex;

    items.forEach(function(el, index){
      if (el.id == $scope.product.id) {
        aux = 1;
        auxIndex = index;
      }
    });

    if (aux == 1) {
      items.splice(auxIndex, 1);
      delete items[auxIndex];
      localStorage.setItem('Cart', JSON.stringify(items));
      aux = 0;
      auxIndex = undefined;
    }
  };

  $scope.buy = function() {
    $http({
      url: '/orders',
      method: 'post',
      data: {
        product_id: $scope.product.id,
        product_name: $scope.product.name,
        quantity: $scope.product.quantity
      }
    })
    .then(function(response){
      console.log("Salvo");
    },
    function(response){
      console.log("Não salvo");
    })
  }

}]);
