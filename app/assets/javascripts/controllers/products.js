app.controller('indexProductCtrl', function($scope, $http, $location) {
  $scope.products = [];
  var request = {
    method: 'get',
    url: '/api/products.json'
  };
  $http(request)
    .success(function(data) {
      $scope.products = data.products;
      console.log(data);
    });

  $scope.edit = function(productId) {
    window.location.href = "/admin/products/" + productId + "/edit";
  };

  $scope.remove = function(productId, index) {
    var r = confirm("Deseja realmente excluir este produto?");
    if (r === true) {
      var reqRemove = {
        type: 'json',
        method: 'delete',
        url: '/api/products/' + productId
      };
      $http(reqRemove)
        .success(function(data, status) {
          console.log(data);
          $scope.products.splice(index, 1);
          $('.alertInfo').html(
            "<div class='alert alert-info alert-dismissible' role='alert'>"
            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
            + "<span aria-hidden='true'>&times;</span></button>"
            + "Página removida com sucesso."
            + "</div>"
            );
        })
        .error(function(status) {
          console.log(status);
          $('.alertInfo').html(
            "<div class='alert alert-danger alert-dismissible' role='alert'>"
            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
            + "<span aria-hidden='true'>&times;</span></button>"
            + "Não foi possível excluir esta página."
            + "</div>"
            );
        });
    }
  };
});
