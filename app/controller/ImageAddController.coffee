ImageAddController = ($scope, $resource, $location, $routeParams, GalleryResource) ->

    $scope.gallery = GalleryResource.get({id: $routeParams.galleryId })
    $scope.image = {}
    
    $scope.formSubmit = ->



    $scope.uploadComplete = (contents, completed) ->
        console.log contents
        console.log completed