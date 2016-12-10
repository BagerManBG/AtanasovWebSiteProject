var app = angular.module('app', ['ngRoute']);

app.config(function($routeProvider, $locationProvider) {

    $locationProvider.html5Mode({
        enabled:true,
        requireBase:false
    });

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
    $routeProvider.otherwise({redirectTo: '/'});
});