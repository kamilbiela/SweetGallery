GalleryAddController = ($scope, $resource, GalleryResource) ->

    $scope.gallery = {}
    
    $scope.formSubmit = ->
        GalleryResource.save $scope.gallery, (gallery, resHeaders) ->
            console.log 'SAVED!'