myApp.controller('ChapterCtrl', function($scope, Chapter){
  $scope.chapters = Chapter.index();
  $scope.search = function(){
    $scope.chapters = Chapter.index($scope.searchForm);
  };
});
