myApp.controller('MainCtrl', ['$scope', 'api', function($scope, api){
  $scope.audit_types = api.AuditTypes.query();
  $scope.locations_list = api.Locations.query();
  $scope.list2 = [];
  $scope.companies = api.Companies.query();
  $scope.employees = api.Employees.query();

  $scope.showAudit = function(audit){
    $scope.show_audit = audit;
  };

  // today = new Date()  
  // $scope.campaign = {
  //   start_at: new Date(),
  //   end_at: today.setDate(today.getDate() + 10)
  // };

  //------------------------
  $scope.showInfo = function(paragraph) {
    res = true;
    if ($scope.paragraph_info && $scope.paragraph_info.id != paragraph.id) {
      $scope.paragraph_info = api.ParagraphInfo.get({id: paragraph.id});
      res = false;
    }
    else{
      $scope.paragraph_info = api.ParagraphInfo.get({id: paragraph.id});
    };
    res ? $("#paragraph-info .info-box").toggleClass('hide') : $("#paragraph-info .info-box").removeClass('hide');
  };
  //------------------------
}]);