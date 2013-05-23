ImageAddEditController = ($scope, $location, $routeParams, $window, $http) ->

    $scope.gallery = {}
    $scope.image = {}
    $scope.isNew = !$routeParams.id


    $http.get("/api/galleries/#{$routeParams.galleryId}").success (data, status) ->
        $scope.gallery = data

    if !$scope.isNew
        $http.get("/api/images/#{$routeParams.id}").success (data, status) ->
            $scope.image = data

    $scope.uploadComplete = (content, completed) ->
        if completed
            $window.setTimeout ->
                $location.path "gallery/#{$scope.gallery.id}/images"
            , 100
        else
