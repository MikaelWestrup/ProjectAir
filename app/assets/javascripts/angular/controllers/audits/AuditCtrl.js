myApp.controller('AuditCtrl', ['$scope', 'api', function($scope, api){
  $scope.audits = api.Audit.index();  // Import resources and Listing data
  initialize();  // Initialize elements with default values

  function initialize() {
    $scope.intervals = [6,12,24];
    $scope.auditType = null;
    $scope.fine_tunes = []; add_ft(); // Initialize one object at starting
    currentDate = new Date();
    currentDate = currentDate.toLocaleDateString()//.split('/').join('-')
    $scope.audit_date = {"start": {"date": currentDate, "time": "10:00"}, "end": {"date": currentDate, "time": "10:00"}};
    $scope.audit = null;
    $scope.fineTuneIsValid = false;
  };

  $scope.submit = function(){
    setParams();
    function success(response) {
      alert("Audit is successfully created.");
      window.location.reload();
    }
    function failure(response) {
      console.log("failure", response);
    }
    newAudit = { audit: $scope.audit, location: $scope.locations };
    if (validateAuditForm(newAudit)) {
      api.Audit.create(newAudit, success, failure);
    } else {
      window.alert("Audit can't be created!\n Please enter required fields.");
    }
  };

  $scope.$on('ngRepeatFinished', function(ngRepeatFinishedEvent){
    DropDownMenu();
  });

  $scope.aa = function(type, id) {
    if (type) {
      $scope.open_id = id;
      this.changeText($scope.audit_date.start.date, $scope.audit_date.end.date);
    }
    else{
      $scope.open_id = null;
    };
  };

  $scope.reset = function() {
    initialize();
    $scope.list2 = [];
  };

  $scope.delete_audit = function(audit) {
    api.Audit.destroy({id: audit.id});
    $scope.audits = api.Audit.index();
  };
  
  $scope.setAuditType = function(auditType){
    $scope.auditType = auditType;
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
    $scope.participantsPopup = false;
    $scope.auditors = [];
    $scope.auditees = [];
    auditors_size = false; audites_size = false;
    elements = $("#participantsPopup .auditor-list .selected");
    var auditor = []; var auditee = [];
    $("#participantsPopup .auditor-list .selected").each(function(index){
      auditors_size = true;
      $scope.auditors[index] = parseInt($(this).attr('value'));
    });

    $("#participantsPopup .auditee-list .selected").each(function(index){
      audites_size = true;
      $scope.auditees[index] = parseInt($(this).attr('value'));
    });
    $scope.participantsHighlight = (auditors_size && audites_size) ? true : false;
  };

  $scope.addFineTune = function() {
    add_ft();
  };

  $scope.show_date = function(date) {
    if (date != null) {
      return new Date(date).toDateString()
    };
  };

  function add_ft() {
    arr = {"date": null, "start_time": {"hour": null, "min": null}, "end_time": {"hour": null, "min": null}, "paragraph": null, "note": null};
    if (validate_fine_tune()) {
      $scope.fine_tunes.push(arr);
    };
  };

  function validate_fine_tune() {
    size = $scope.fine_tunes.length;
    if (size == 0) { return true; }
    else {
      ft = $scope.fine_tunes[size-1];
      return (ft.date && ft.start_time.hour && ft.start_time.min && ft.end_time.hour && ft.end_time.min && ft.paragraph) ? true : false;
    };
  };

  function setParams(){
    $scope.audit["audit_type_id"] = $scope.auditType.id || null;
    $scope.audit["period_start"] = $scope.audit_date.start.date + " " + $scope.audit_date.start.time;
    $scope.audit["period_end"] = $scope.audit_date.end.date + " " + $scope.audit_date.end.time;
    $scope.audit["paragraphs"] = getParagraphsList();
    $scope.audit["auditors"] = $scope.auditors;
    $scope.audit["auditees"] = $scope.auditees;
    $scope.audit["fine_tunes"] = $scope.fine_tunes;
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

  $scope.myCallback = function(event, ui){
    length = $scope.list2.length;
    item = $scope.list2[length-1];
    $scope.list2.pop();
    if(itemPresent(item)){
      window.alert("This paragraph is already added for audit");
    }
    else{
      $scope.list2.push(item);
    };
  };

  $scope.removeItemFromList = function(item) {
    if (itemPresent(item)) {
      index = $scope.list2.indexOf(item);
      $scope.list2.splice(index,1);
    };
  };

  itemPresent = function(item){
    status = false;
    angular.forEach($scope.list2, function(value, key){
      if(value == item ){
        status = true;
      }
    });
    return status=='true' ? true : false;
  };

  $scope.validateFineTune = function() {
    ft = [];
    angular.forEach($scope.fine_tunes, function(value, key) {
      if (value.date && value.start_time.hour && value.start_time.min && value.end_time.hour && value.end_time.min && value.paragraph) {
        this.push(value);
      }
    }, ft);
    $scope.fine_tunes = ft;
    $scope.fineTuneIsValid = true;
  };

  validateAuditForm = function(new_audit) {
    audit = new_audit.audit;
    return (audit.name && (audit.paragraphs.length > 0) && (audit.audit_type_id != null)) ? true : false;
  };
}]);