TEST = 1
GalleryListController = ($scope, $window, $location, $http, Gallery, GalleryMapper) ->

    $scope.testGallery = GalleryMapper.findOne 19

    $http.get('/api/galleries').success (data, status) ->
        $scope.galleries = data
    
    $scope.doTest = () ->


    $scope.showButtons = (loopScope) ->
        loopScope.buttonsVisible = true
        
    $scope.hideButtons = (loopScope) ->
        loopScope.buttonsVisible = false
        
    $scope.deleteGallery = (gallery) ->
        $http({method: 'DELETE', url: "/api/galleries/#{gallery.id}"}).success (data, status) ->
            gallery.isDeleted = true

