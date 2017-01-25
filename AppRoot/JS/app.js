'use strict';

var app = angular.module('app', ['ngRoute']);

app.config(function($routeProvider) {

    $routeProvider.when('/', {
        templateUrl: 'Resources/Templates/home.html'
    });
    $routeProvider.when('/chat-admin', {
        templateUrl: 'Resources/Templates/chat_admin.html'
    });
    $routeProvider.when('/profile', {
        templateUrl: 'Resources/Templates/profile.html'
    });
    $routeProvider.when('/courses', {
        templateUrl: 'Resources/Templates/courses/index.html'
    });
    $routeProvider.when('/courses/details', {
        templateUrl: 'Resources/Templates/courses/details.html'
    });
    $routeProvider.when('/courses/edit', {
        templateUrl: 'Resources/Templates/courses/edit.html'
    });
    $routeProvider.when('/create', {
        templateUrl: 'Resources/Templates/courses/create.html'
    });
    $routeProvider.when('/calendar', {
        templateUrl: 'Resources/Templates/lectures/calendar.html'
    });
    $routeProvider.when('/create-lecture', {
        templateUrl: 'Resources/Templates/lectures/create.html'
    });
    $routeProvider.when('/edit-lecture', {
        templateUrl: 'Resources/Templates/lectures/edit.html'
    });
    $routeProvider.when('/difficulty-levels', {
        templateUrl: 'Resources/Templates/difficulty_levels/index.html'
    });
    $routeProvider.when('/create-level', {
        templateUrl: 'Resources/Templates/difficulty_levels/create.html'
    });
    $routeProvider.when('/details-level', {
        templateUrl: 'Resources/Templates/difficulty_levels/details.html'
    });
    $routeProvider.when('/edit-level', {
        templateUrl: 'Resources/Templates/difficulty_levels/edit.html'
    });
    $routeProvider.otherwise({redirectTo: '/'});
});
//
//app.directive('navigation', function() {
//    return {
//        restrict: 'E',
//        templateUrl: 'Resources/Templates/nav.html',
//        scope: {}
//    }
//});
//
//app.directive('footer', function() {
//    return {
//        restrict: 'E',
//        templateUrl: 'Resources/Templates/footer.html'
//    }
//});
