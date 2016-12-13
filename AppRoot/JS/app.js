'use strict';

var app = angular.module('app', ['ngRoute']);

app.config(function($routeProvider) {

    $routeProvider.when('/', {
        templateUrl: 'Resources/Templates/home.html'
    });
    $routeProvider.when('/chat', {
        templateUrl: 'Resources/Templates/chat.html'
    });
    $routeProvider.when('/chat-admin', {
        templateUrl: 'Resources/Templates/chat-admin.html'
    });
    $routeProvider.when('/profile', {
        templateUrl: 'Resources/Templates/profile.html'
    });
    $routeProvider.when('/login', {
        templateUrl: 'Resources/Templates/login_register.html'
    });
    $routeProvider.otherwise({redirectTo: '/'});
});

app.directive('navigation', function() {
    return {
        restrict: 'E',
        templateUrl: 'Resources/Templates/nav.html',
        scope: {}
    }
});

app.directive('footer', function() {
    return {
        restrict: 'E',
        templateUrl: 'Resources/Templates/footer.html'
    }
});