GalleryListController = ($scope, $resource, GalleryResource) ->
    
    $scope.galleries = GalleryResource.query {}
    
    $scope.showButtons = ($scope) ->
        $scope.buttonsVisible = true
        
    $scope.hideButtons = ($scope) ->
        $scope.buttonsVisible = false
