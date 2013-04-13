SweetGalleryApp.factory 'GalleryResource', ($resource) ->
    $resource '/api/galleries/:_id', {_id: '@_id'}
