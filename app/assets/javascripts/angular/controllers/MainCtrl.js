myApp.controller('MainCtrl', ['$scope', 'api', function($scope, api){
  // Import resources and Listing data
  $scope.audit_types = api.AuditTypes.query();
  $scope.locations_list = api.Locations.query();
  $scope.companies = api.Companies.query();
  $scope.employees = api.Employee.index();
  
  // Initialize elements with default values
  $scope.list2 = [];

  $scope.showAudit = function(audit){
    $scope.show_audit = audit;
  };

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
  $scope.employeeInfo = function(employee) {
    $scope.employee_info = api.Employee.show({id: employee.id});
  };
  //------------------------
}]);