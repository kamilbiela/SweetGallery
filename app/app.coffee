SweetGalleryApp = angular.module('SweetGalleryApp', ['$strap.directives', 'ngUpload'])

SweetGalleryApp.config ($routeProvider) ->
    $routeProvider
        .when(
            '/',
                controller: 'GalleryListController'
                templateUrl: 'app/view/galleryList.html'
        )
        .when(
            '/gallery/add',
                controller: 'GalleryAddEditController'
                templateUrl: 'app/view/galleryAddEdit.html'
        )
        .when(
            '/gallery/edit/:id',
                controller: 'GalleryAddEditController'
                templateUrl: 'app/view/galleryAddEdit.html'
        )
        .when(
            '/gallery/:galleryId/images',
                controller: 'ImageListController'
                templateUrl: 'app/view/imageList.html'
        )
        .when(
            '/gallery/:galleryId/images/add',
                controller: 'ImageAddEditController'
                templateUrl: 'app/view/imageAddEdit.html'
        )
        .when(
            '/gallery/:galleryId/images/edit/:id',
                controller: 'ImageAddEditController'
                templateUrl: 'app/view/imageAddEdit.html'
        )

