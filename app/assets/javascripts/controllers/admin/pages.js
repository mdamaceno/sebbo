app.controller('indexPageCtrl', function($scope, $http, $location) {
  $scope.pages = [];
  var request = {
    method: 'get',
    url: '/admin/pages.json'
  };
  $http(request)
    .success(function(data) {
      $scope.pages = data.pages;
      console.log(data);
    });

  $scope.edit = function(pageId) {
    window.location.href = "/admin/pages/" + pageId + "/edit";
  };

  $scope.remove = function(pageId, index) {
    var r = confirm("Deseja realmente excluir esta página?");
    if (r === true) {
      var reqRemove = {
        type: 'json',
        method: 'delete',
        url: '/admin/pages/' + pageId
      };
      $http(reqRemove)
        .success(function(data, status) {
          console.log(data);
          $scope.pages.splice(index, 1);
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
