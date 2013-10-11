(function (window) {
    window.app = angular.module('PDFLib', ['ngResource'])
        .config(['$routeProvider', function($routeProvider) {
            $routeProvider.
                when('/', { templateUrl: 'templates/main.html', controller: 'MainController' }).
                otherwise({ redirectTo: '/' });
            }]);
})(window);
