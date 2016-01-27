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

// myApp.directive('hourTimePicker', function() {
myApp.directive('selectHourTime', function() {
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

// myApp.directive('minuteTimePicker', function() {
myApp.directive('selectMinuteTime', function() {
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

myApp.directive("customDatepicker", function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      element.datepicker({
        dateFormat: "mm-dd-yy",
        minDate: new Date(),
        // maxDate: new Date(max),
        onSelect: function(date) {
          scope.$apply(function(){
            ngModel.$setViewValue(date);
            ngModel.$viewValue = date;
            ngModel.$render();
          });
        }
      });
    }
  };
});

//-----------------------------------------------------------

myApp.directive("rangeTimeSlider", function() {
  return {
    require: 'ngModel',
    link: function(scope, element, attrs, ngModel) {
      element.slider({
        range: "max",
        min: 1,
        max: 1439,
        value: 600,
        slide: function( event, ui ) {
          var hours1 = Math.floor(ui.value / 60);
          var minutes1 = ui.value - (hours1 * 60);
          if (hours1 < 10) hours1 = '0' + hours1;
          if (minutes1 < 10) minutes1 = '0' + minutes1;
          scope.$apply(function(){
            ngModel.$setViewValue(hours1 + ':' + minutes1);
            ngModel.$viewValue = hours1 + ':' + minutes1;
            ngModel.$render();
          });
        }
      });
    }
  };
});

//-----------------------------------------------------------

myApp.directive('ngConfirmClick', function(){
  return {
    link: function (scope, element, attr) {
      var msg = attr.ngConfirmClick || "Are you sure?";
      var clickAction = attr.confirmedClick;
      element.bind('click',function (event) {
        if ( window.confirm(msg) ) {
          scope.$eval(clickAction)
        }
      });
    }
  };
});