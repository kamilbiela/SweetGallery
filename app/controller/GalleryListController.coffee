GalleryListController = ($scope, $window, $location, $http) ->

    $http.get('/api/galleries').success (data, status) ->
        $scope.galleries = data
    
    $scope.showButtons = (loopScope) ->
        loopScope.buttonsVisible = true
        
    $scope.hideButtons = (loopScope) ->
        loopScope.buttonsVisible = false
        
    $scope.deleteGallery = (gallery) ->
        $http({method: 'DELETE', url: "/api/galleries/#{gallery.id}"}).success (data, status) ->
            gallery.isDeleted = true

