myApp.controller('MainCtrl', function($scope, db_data){
  $scope.chapters = db_data.chapters;
  $scope.audit_types = db_data.audit_types;
  $scope.intervals = [6,12,24];
  $scope.range = function(val){
    arr = [];
    for (var i = val; i >= 0; i--){
      arr.push(i);
    }
    return arr;
  };
  $scope.addAudit = function(){
    var newAudit = $scope.newAudit;
    if (newAudit) {
      if($scope.audit_type){
        newAudit.audit_type = $scope.audit_type;
      };
      if (newAudit.repeating == 'true') {
        newAudit.interval = $scope.rinterval;
      };
      if (newAudit.startDate && newAudit.startTime) {
        newAudit.startDateTime = calculateDate(newAudit.startDate, newAudit.startTime);
      };
      if (newAudit.endDate && newAudit.endTime) {
        newAudit.endDateTime = calculateDate(newAudit.endDate, newAudit.endTime);
      };
      $scope.newAudit = newAudit;
      // $scope.fullDate = calculateDate(ddate, ttime);
      console.log(newAudit);
    };
  };
  $scope.select_auditor = function(){
    elements = $("#participantsPopup .auditor-list .selected");
    var auditor = [];
    $("#participantsPopup .auditor-list .selected").each(function(index){
      auditor[index] = $(this).attr('value');
    });
  };
  $scope.m_audit_type = function(sub_type){
    $scope.audit_type = sub_type;
  };
  $scope.timeInterval = function(value, operation){
    if (operation == '-' && value-3 >= 0) {
      $scope.intervals = [value-3, value-2, value-1];
    };
    if (operation == '+' && value+3 < 100) {
      $scope.intervals = [value+1, value+2, value+3];
    };
  };
  $scope.repeatInterval = function(interval){
    $scope.rinterval = interval;
  };
  calculateDate = function(date,time){
    return Date.apply(undefined,date.split('/').concat(time.split(':')));
  };

  $scope.test = function(){
    var startDate = $("#start_date").val();
    var endDate = $("#end_date").val();
    var startTime = $("#start_time").text();
    var endTime = $("#end_time").text();
    var sdate = calculateDate(startDate, startTime);
    var edate = calculateDate(endDate, endTime);
  };
});