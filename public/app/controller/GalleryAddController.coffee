GalleryAddController = ($scope, $resource) ->

    $scope.gallery = {name: "asd"}
    
    $scope.formSubmit = ->
        alert(123)
        console.log $scope.gallery