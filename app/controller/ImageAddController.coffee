ImageAddController = ($scope, $resource, $location, $routeParams, $window, GalleryResource) ->

    $scope.gallery = GalleryResource.get({id: $routeParams.galleryId })
    $scope.image = {}
    
    $scope.formSubmit = ->

    $scope.uploadComplete = (content, completed) ->
        if completed
            $window.setTimeout ->
                $location.path 'gallery/' + $scope.gallery.id + '/images'
            , 100
        else
