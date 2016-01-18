myApp.controller('MainCtrl', ['$scope', 'api', function($scope, api){
  $scope.audit_types = api.AuditTypes.query();
  $scope.locations_list = api.Locations.query();
  $scope.list2 = [];
  $scope.companies = api.Companies.query();
  $scope.employees = api.Employees.query();
}]);