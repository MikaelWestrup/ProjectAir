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

//-----------------------------------------------------------

myApp.directive('onFinishRender', function($timeout) {
  return {
    restrict: 'A',
    link: function(scope, element, attrs) {
      if (scope.$last === true) {
        $timeout(function() {
          scope.$emit('ngRepeatFinished');
        });
      };
    }
  };
});

//-----------------------------------------------------------

myApp.directive('hourTimePicker', function() {
  return {
    restrict: 'E',
    require: 'ngModel',
    replace: true,
    link: function(scope, element, attrs) {
      t = [];
      for (var i = 0; i < 24; i++) {
        if (i < 10) { t[i] = '0'+ i.toString(); } else { t[i] = i; };
      };
      scope.hours = t;
    },
    template: '<select name="hourtimepicker" class="form-control">\
    <option value="{{hour}}" ng-repeat="hour in hours">{{hour}}</option>\
    </select>'
  };
});

//-----------------------------------------------------------

myApp.directive('minuteTimePicker', function() {
  return {
    restrict: 'E',
    require: 'ngModel',
    replace: true,
    link: function(scope, element, attrs) {
      scope.minutes = ['00','15','30','45'];
    },
    template: '<select name="minutetimepicker" class="form-control">\
    <option value="{{minute}}" ng-repeat="minute in minutes">{{minute}}</option>\
    </select>'
  };
});

//-----------------------------------------------------------

myApp.directive("finetuneDatepicker", function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      scope.changeText = function(min, max) {
        element.datepicker({
          dateFormat: "mm-dd-yy",
          minDate: new Date(min),
          maxDate: new Date(max),
          onSelect: function(date) {
            scope.$apply(function(){
              ngModel.$setViewValue(date);
              ngModel.$viewValue = date;
              ngModel.$render();
            });
          }
        });
      };
    }
  };
});

//-----------------------------------------------------------

// myApp.directive("endDateCalendar", [
//   function() {
//     return function(scope, element, attrs) {
//     scope.$watch("campaign.start_at", (function(newValue, oldValue) {
//       element.datepicker("option", "minDate", newValue);
//     }), true);

//       return element.datepicker({
//         dateFormat: "mm-dd-yy",
//         // numberOfMonths: 2,
//         minDate: scope.campaign.start_at,
//         defaultDate: scope.campaign.end_at,
//         // beforeShowDay: $.datepicker.noWeekends,
//         onSelect: function(date) {
//           scope.campaign.end_at = date;
//           return scope.$apply();
//         }
//       });
//     };
//   }
// ]);