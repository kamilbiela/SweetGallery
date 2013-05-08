GalleryEditController = ($scope, $resource, $routeParams, $location, GalleryResource) ->
    angular.extend this, new GalleryAddController($scope, $resource, $location, GalleryResource)
        
    $scope.gallery = GalleryResource.get({id: $routeParams.id})
