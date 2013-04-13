SweetGalleryApp.factory 'ImageResource', ($resource) ->
    $resource '/api/images/:_id', {_id: '@_id'}
