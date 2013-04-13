GalleryAddController = ($scope, $resource, $location, GalleryResource) ->

    $scope.gallery = {}
    
    $scope.formSubmit = ->
        GalleryResource.save $scope.gallery, (gallery, resHeaders) ->
            $location.path('/')