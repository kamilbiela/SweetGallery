'use strict';

sweetGalleryApp = angular.module('sweetGalleryApp', ['ngResource'])

sweetGalleryApp.config ($routeProvider) ->
    $routeProvider
        .when('/', 
            controller: 'GalleryListController'
            templateUrl: 'app/view/galleryList.html'
        )
        .when('/gallery/add', {
            controller: 'GalleryAddController'
            templateUrl: 'app/view/galleryAdd.html'
        })
        .when('/gallery/edit/:id', {
            controller: 'GalleryEditController'
            templateUrl: 'app/view/galleryAdd.html'
        })
        ;

