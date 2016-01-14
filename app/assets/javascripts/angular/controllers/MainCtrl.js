myApp.controller('MainCtrl', ['$scope', 'db_data', function($scope, db_data){
  $scope.audit_types = db_data.audit_types;

  $scope.select_auditor = function(){
    elements = $("#participantsPopup .auditor-list .selected");
    var auditor = [];
    $("#participantsPopup .auditor-list .selected").each(function(index){
      auditor[index] = $(this).attr('value');
    });
  };
}]);