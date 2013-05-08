SweetGalleryApp.factory 'ImageResource', ($resource) ->
    image = $resource '/api/images/:id', {id: '@id'}

    return image