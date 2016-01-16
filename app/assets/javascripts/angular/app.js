var myApp = angular.module('myApp', ["ngResource","ngDragDrop","angular.chosen"]);

myApp.config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
});
