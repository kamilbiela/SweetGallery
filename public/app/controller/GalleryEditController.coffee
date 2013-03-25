GalleryEditController = ($scope, $resource, $routeParams, $location, GalleryResource) ->
    angular.extend this, new GalleryAddController($scope, $resource, $location, GalleryResource)
        
    $scope.gallery = GalleryResource.get({_id: $routeParams._id})
    
    
        
   