myApp.controller('AuditCtrl', function($scope, api){
  $scope.audits = api.Audit.index();
  $scope.intervals = [6,12,24];
  $scope.auditType = null;
  
  $scope.submit = function(){
    setParams();

    function success(response) {
      console.log("success", response);
      alert("Audit is successfully created.");
      window.location.reload();
      // $scope.audit = $scope.locations = {};
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

    newAudit = { audit: $scope.audit, location: $scope.locations };
    api.Audit.create(newAudit, success, failure);
  };

  $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent){
    DropDownMenu();
  });

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

  $scope.setLocation = function(location) {
    if (location != null) {
      $scope.locations = location;
    };
  };

  $scope.changeInterval = function(value, operation){
    if (operation == '-' && value-3 >= 0) {
      $scope.intervals = [value-3, value-2, value-1];
    };
    if (operation == '+' && value+3 < 49) {
      $scope.intervals = [value+1, value+2, value+3];
    };
  };

  $scope.auditee_employees = function() {
    if ($scope.departmentSelect) {
      $scope.auditee_list = api.AuditeeEmployees.query({id: $scope.departmentSelect.id});
    }
    else{
      $scope.auditee_list = null;
    };
  };

  $scope.select_auditor = function(){
    elements = $("#participantsPopup .auditor-list .selected");
    var auditor = [];
    $("#participantsPopup .auditor-list .selected").each(function(index){
      auditor[index] = $(this).attr('value');
    });
  };

  function setParams(){
    $scope.audit["audit_type_id"] = ($scope.auditType ? $scope.auditType.id : null);
    $scope.audit["interval"] = ($scope.audit.reoccuring == 'true' ? ($scope.rinterval || 0) : (0));
    $scope.audit["period_start"] = $scope.sdate || null;
    $scope.audit["period_end"] = $scope.edate || null;
    $scope.audit["reoccuring"] = $scope.audit["reoccuring"] == "true" ? true : false;
    $scope.audit["onsite"] = $scope.audit["onsite"] == "true" ? true : false;
    $scope.audit["paragraphs"] = getParagraphsList();
  };

  function getParagraphsList() {
    var paras = [];
    angular.forEach($scope.list2, function(value, key) {
      this.push(value.id);
    }, paras);
    return paras;
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