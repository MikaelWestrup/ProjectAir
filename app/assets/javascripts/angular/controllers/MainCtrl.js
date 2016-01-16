myApp.controller('MainCtrl', ['$scope', 'api', function($scope, api){
  $scope.audit_types = api.AuditTypes.query();
  $scope.locations_list = api.Locations.query();
  $scope.list2 = [];

  $scope.select_auditor = function(){
    elements = $("#participantsPopup .auditor-list .selected");
    var auditor = [];
    $("#participantsPopup .auditor-list .selected").each(function(index){
      auditor[index] = $(this).attr('value');
    });
  };
}]);