myApp.controller('MainCtrl', ['$scope', 'api', function($scope, api){
  // Import resources and Listing data
  $scope.audit_types = api.AuditTypes.query();
  $scope.list_chapter_types = api.ChaptersCtype.query();
  $scope.locations_list = api.Locations.query();
  $scope.companies = api.Companies.query();
  $scope.employees = api.Employee.index();
  
  // Initialize elements with default values
  $scope.list2 = [];
  
  //------------------------
  $scope.showAudit = function(audit) {
    $scope.show_audit = api.Audit.show({id: audit.id});
    // $scope.show_audit = audit;
  };

  $scope.paragraphName = function(id) {
    angular.forEach($scope.show_audit.paragraphs, function(value, key){
      if(value.id == id)
        para_name = value.name;
    });
    return para_name;
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
    // $scope.employeeInfoPopup = true;
    $scope.employee_info = api.Employee.show({id: employee.id});
  };
  //------------------------
  $scope.getTime = function(start_hour, end_hour) {
    str = '';
    str += start_hour.length ? start_hour.split(/['T','.']/)[1].split(':00')[0] : '00:00';
    str += " - ";
    str += end_hour.length ? end_hour.split(/['T','.']/)[1].split(':00')[0] : '00:00';
    return str;
  };
  //------------------------
}]);