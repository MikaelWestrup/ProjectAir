myApp.controller('AuditCtrl', function($scope, Audit){
  // $scope.audit = new Audit();
  $scope.intervals = [6,12,24];

  $scope.submit = function(){
    setParams();
    console.log($scope.audit);

    function success(response) {
      console.log("success", response);
    }

    function failure(response) {
      console.log("failure", response);
      // _.each(response.data, function(errors, key) {
      //   _.each(errors, function(e) {
      //     $scope.form[key].$dirty = true;
      //     $scope.form[key].$setValidity(e, false);
      //   });
      // });
    }

    newAudit = { audit: $scope.audit };
    console.log(newAudit);
    Audit.create(newAudit, success, failure);

  };

  $scope.setAuditType = function(auditType){
    $scope.auditType = auditType;
  };

  $scope.setInterval = function(interval){
    $scope.rinterval = interval;
  };

  $scope.setDateTime = function(){
    $scope.sdate = $("#start_date").val() + " " + $("#start_time").text();
    $scope.edate = $("#end_date").val() + " " + $("#end_time").text();
  };

  $scope.setLocation = function() {
    console.log($scope.audit);
  };

  $scope.changeInterval = function(value, operation){
    if (operation == '-' && value-3 >= 0) {
      $scope.intervals = [value-3, value-2, value-1];
    };
    if (operation == '+' && value+3 < 49) {
      $scope.intervals = [value+1, value+2, value+3];
    };
  };

  function setParams(){
    $scope.audit["audit_type_id"] = ($scope.auditType ? $scope.auditType.id : null);
    $scope.audit["interval"] = ($scope.audit.reoccuring == 'true' ? ($scope.rinterval || 0) : (0));
    $scope.audit["period_start"] = $scope.sdate || null;
    $scope.audit["period_end"] = $scope.edate || null;
  };

  function toDateTime(date,time){
    return date + " " + time;
  };

  $scope.range = function(val){
    arr = [];
    for (var i = val; i >= 0; i--){
      arr.push(i);
    }
    return arr;
  };
});