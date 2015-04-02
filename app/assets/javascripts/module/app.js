var app = angular.module('adminModule', []);
var appClient = angular.module('clientModule', ['ngSanitize']);

appClient.directive('fundooRating', function() {
  return {
    restrict: 'A',
    template: '<ul class="rating">' +
      '<li ng-repeat="star in stars" ng-class="star" ng-click="toggle($index)">' +
      '\u2605' +
      '</li>' +
      '</ul>',
    scope: {
      ratingValue: '=',
      max: '=',
      readonly: '@',
      onRatingSelected: '&'
    },
    link: function(scope, elem, attrs) {

      var updateStars = function() {
        scope.stars = [];
        for (var i = 0; i < scope.max; i++) {
          scope.stars.push({
            filled: i < scope.ratingValue
          });
        }
      };

      scope.toggle = function(index) {
        if (scope.readonly && scope.readonly === 'true') {
          return;
        }
        scope.ratingValue = index + 1;
        scope.onRatingSelected({
          rating: index + 1
        });
      };

      scope.$watch('ratingValue', function(oldVal, newVal) {
        if (newVal) {
          updateStars();
        }
      });
    }
  }
});

appClient.factory('CartService', function() {
  var CartCollection = JSON.parse(localStorage.getItem('Cart')) || [];

  this.add = function(item) {
    if (CartCollection.indexOf(item) === -1) {
      CartCollection.push(item);
      localStorage.setItem('Cart', JSON.stringify(CartCollection));
    }
  }
  this.get = function() {
    return JSON.parse(localStorage.getItem('Cart'));
  }
  return this;
});
