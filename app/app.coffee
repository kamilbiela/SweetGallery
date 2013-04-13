SweetGalleryApp = angular.module('SweetGalleryApp', ['ngResource', '$strap.directives', 'ngUpload'])

SweetGalleryApp.config ($routeProvider) ->
    $routeProvider
        .when('/', 
            controller: 'GalleryListController'
            templateUrl: 'app/view/galleryList.html'
        )
        .when('/gallery/add', 
            controller: 'GalleryAddController'
            templateUrl: 'app/view/galleryAdd.html'
        )
        .when('/gallery/edit/:_id', 
            controller: 'GalleryEditController'
            templateUrl: 'app/view/galleryAdd.html'
        )
        .when('/gallery/:galleryId/images', 
            controller: 'ImageListController'
            templateUrl: 'app/view/imageList.html'
        )
        .when('/gallery/:galleryId/images/add', 
            controller: 'ImageAddController'
            templateUrl: 'app/view/imageAdd.html'
        )

