GalleryEditController = ($scope, $resource, GalleryResource, $routeParams) ->
    angular.extend @, new GalleryAddController($scope, $resource, GalleryResource)
        
    $scope.gallery = GalleryResource.get({id: $routeParams.id})
        
   