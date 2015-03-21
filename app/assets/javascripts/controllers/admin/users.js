app.controller('indexUserCtrl', function($scope, $http, $location) {
  $scope.users = [];
  var request = {
    method: 'get',
    url: '/admin/users.json'
  };
  $http(request)
    .success(function(data) {
      $scope.users = data.users;
      console.log(data);
    });

  $scope.edit = function(userId) {
    window.location.href = "/admin/users/" + userId + "/edit";
  };

  $scope.remove = function(userId, index) {
    var r = confirm("Deseja realmente excluir esta página?");
    if (r === true) {
      var reqRemove = {
        type: 'json',
        method: 'delete',
        url: '/admin/users/' + userId
      };
      $http(reqRemove)
        .success(function(data, status) {
          console.log(data);
          $scope.users.splice(index, 1);
          $('.alertInfo').html(
            "<div class='alert alert-info alert-dismissible' role='alert'>"
            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
            + "<span aria-hidden='true'>&times;</span></button>"
            + "Usuário removido com sucesso."
            + "</div>"
            );
        })
        .error(function(status) {
          console.log(status);
          $('.alertInfo').html(
            "<div class='alert alert-danger alert-dismissible' role='alert'>"
            + "<button type='button' class='close' data-dismiss='alert' aria-label='Close'>"
            + "<span aria-hidden='true'>&times;</span></button>"
            + "Não foi possível excluir este usuário."
            + "</div>"
            );
        });
    }
  };
});
