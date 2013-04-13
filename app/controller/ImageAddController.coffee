ImageAddController = ($scope, $resource, $location, $routeParams, GalleryResource) ->

    $scope.gallery = GalleryResource.get({_id: $routeParams.galleryId })
    $scope.image = {}
    
    $scope.formSubmit = ->
        GalleryResource.save $scope.gallery, (gallery, resHeaders) ->
            $location.path('/')


    $scope.uploadComplete = (contents, completed) ->
        console.log contents
        console.log completed