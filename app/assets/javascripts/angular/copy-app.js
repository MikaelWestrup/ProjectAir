var myApp = angular.module('myApp', ["ngResource"]);

myApp.config(function($httpProvider) {
  $httpProvider.defaults.headers.common['X-CSRF-Token'] =
    $('meta[name=csrf-token]').attr('content');
});

myApp.factory("Chapter", function($resource) {
  return $resource("/api/chapters/:id", { id: "@id" },
    {
      'index':   { method: 'GET', isArray: true }
    }
  );
});

myApp.controller('ChapterIndexCtrl', function($scope, Chapter){
  $scope.chapters = Chapter.index();
  $scope.search = function(){
    $scope.chapters = Chapter.index($scope.searchForm);
    // console.log($scope.searchForm);
  };
});

myApp.factory("Audit", function($resource) {
  return $resource("/api/audits/:id", { id: "@id" },
    {
      'index':   { method: 'GET', isArray: true }
    }
  );
});

myApp.controller('AuditCtrl', function($scope, Audit){
  $scope.auditTypes = Audit.index();
});



myApp.factory('db_data', [function(){
  var object = {
    chapters: [
      {id: 1, name: "Chapter 1", paragraphs: [{id: 1, code: 'A', description: "This is a description of chapter paragraph."}, {id: 10, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 2, name: "Chapter 2", paragraphs: [{id: 2, code: 'A', description: "This is a description of chapter paragraph."}, {id: 11, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 3, name: "Chapter 3", paragraphs: [{id: 3, code: 'A', description: "This is a description of chapter paragraph."}]},
      {id: 4, name: "Chapter 4", paragraphs: [{id: 4, code: 'A', description: "This is a description of chapter paragraph."}, {id: 12, code: 'B', description: "This is a description of chapter paragraph."}]},
      {id: 5, name: "Chapter 5", paragraphs: [{id: 5, code: 'A', description: "This is a description of chapter paragraph."}]}
    ],
    audit_types: [
      {id: 1, name: "Type 1", sub_types: [{id: 1, name: "1 sub type 1"},{id: 2, name: "1 sub type 2"},{id: 3, name: "1 sub type 3"}]},
      {id: 2, name: "Type 2", sub_types: [{id: 4, name: "1 sub type 1"},{id: 7, name: "1 sub type 2"},{id: 10, name: "1 sub type 3"}]},
      {id: 3, name: "Type 3", sub_types: [{id: 5, name: "1 sub type 1"},{id: 8, name: "1 sub type 2"},{id: 11, name: "1 sub type 3"}]},
      {id: 4, name: "Type 4", sub_types: [{id: 6, name: "1 sub type 1"},{id: 9, name: "1 sub type 2"},{id: 12, name: "1 sub type 3"}]}
    ]
  };
  return object;
}]);

myApp.controller('MainCtrl', ['$scope', 'db_data', function($scope, db_data){
  // $scope.chapters = db_data.chapters;
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
}]);

myApp.directive('toggleClass', function() {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
      element.bind('click', function() {
        element.parents('div').first().toggleClass(attrs.toggleClass);
      });
    }
  };
});
