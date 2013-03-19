sweetGalleryApp.factory 'GalleryResource', ($resource) ->
  $resource '/api/galleries/:id', {id: '@id'}
