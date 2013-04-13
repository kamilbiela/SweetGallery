GalleryListController = ($scope, $resource, $window, $location, GalleryResource) ->
    
    $scope.galleries = GalleryResource.query {}
    
    $scope.showButtons = (loopScope) ->
        loopScope.buttonsVisible = true
        
    $scope.hideButtons = (loopScope) ->
        loopScope.buttonsVisible = false
        
    $scope.deleteGallery = (gallery) ->
        gallery.$remove (gallery, responseHeaders) ->
            gallery.isDeleted = true

