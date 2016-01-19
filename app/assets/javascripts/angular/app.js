var myApp = angular.module('myApp', ["ngResource","ngDragDrop","ui.bootstrap"]);

myApp.config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
});
