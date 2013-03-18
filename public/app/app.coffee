'use strict';

GalleryApp = angular.module('galleryApp')

GalleryApp.config ($routeProvider) ->
    $routeProvider.
        when('/', 
            controller: 'GalleryListController',
            templateUrl: 'view/galleryList.html'
        ).       
        when('/help', {
            templateUrl: 'views/help.html'
        });

