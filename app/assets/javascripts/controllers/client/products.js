Array.prototype.unique = function()
{
    var tmp = {}, out = [];
    for(var i = 0, n = this.length; i < n; ++i)
    {
        if(!tmp[this[i]]) { tmp[this[i]] = true; out.push(this[i]); }
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

appClient.controller('showClientProductCtrl', function($scope, $http) {
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

  $scope.addToCart = function(id, name, qtd) {
    console.log(id, name, qtd);

    var oldItems = JSON.parse(localStorage.getItem('itemsArray')) || [];

    var newItem = {
      'id': id,
      'name': name,
      'quantity': qtd
    };

    oldItems.push(newItem);
    b = oldItems.unique();

    alert(b);

    localStorage.setItem('itemsArray', JSON.stringify(b));
  }

});
