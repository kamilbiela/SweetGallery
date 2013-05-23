ImageListController = ($scope, $window, $location, $routeParams, $http) ->
    
    $scope.gallery = {}
    $scope.images = {}

    $http.get("/api/galleries/#{$routeParams.galleryId}").success (data, status) ->
        $scope.gallery = data

    $http.get("/api/galleries/#{$routeParams.galleryId}/images").success (data, status) ->
        $scope.images = data

    $scope.showButtons = (loopScope) ->
        loopScope.buttonsVisible = true
        
    $scope.hideButtons = (loopScope) ->
        loopScope.buttonsVisible = false
        
    $scope.deleteImage = (image) ->
        $http({method: 'DELETE', url: "/api/images/#{image.id}"}).success (data, status) ->
            image.isDeleted = true

