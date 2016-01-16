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
