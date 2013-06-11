GalleryAddEditController = ($scope, $location, $routeParams, $http, GalleryMapper) ->

    $scope.testGallery = GalleryMapper.findOne 19

    $scope.isNew = !$routeParams.id
    $scope.gallery = {}

    if $routeParams.id
        $http.get("/api/galleries/#{$routeParams.id}").success (data, status) ->
            $scope.gallery = data

    $scope.formSubmit = ->
        url = "/api/galleries"
        if !$scope.isNew
            url += "/#{$scope.gallery.id}"

        $http.post(url, $scope.gallery).success (data, status) ->
            $location.path '/'
