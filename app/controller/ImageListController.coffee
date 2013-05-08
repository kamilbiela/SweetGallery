ImageListController = ($scope, $resource, $window, $location, $routeParams, ImageResource, GalleryResource) ->
    
    $scope.gallery = GalleryResource.get {id: $routeParams.galleryId }

    $scope.showButtons = (loopScope) ->
        loopScope.buttonsVisible = true
        
    $scope.hideButtons = (loopScope) ->
        loopScope.buttonsVisible = false
        
    $scope.deleteImage = (image) ->
        image.$remove (image, responseHeaders) ->
            image.isDeleted = true

