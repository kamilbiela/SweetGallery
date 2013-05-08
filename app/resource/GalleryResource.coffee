SweetGalleryApp.factory 'GalleryResource', ($resource) ->
    gallery = $resource '/api/galleries/:id', {id: '@id'}

    gallery::hasImages = ->
        return false if not @images
        
        if @images.length > 0
            true
        else
            false

    return gallery
