SweetGalleryApp.factory 'Gallery', () ->
    class Gallery
        method1: ->
            '123'

SweetGalleryApp.service 'GalleryMapper', ['Gallery', '$http', (Gallery, $http) ->
    return new class GalleryMapper
        registry: {}

        insert: (gallery) ->

        update: (gallery) ->

        delete: (gallery) ->

        findOne: (id, params, successFn, errorFn) ->
            if (@registry[id])
                console.log 'Registry gallery'
                g = @registry[id]
            else
                console.log 'new gallery'
                g = new Gallery

            $http.get("/api/galleries/#{id}").then (response, header) =>
                console.log 'Ajax call'
                angular.copy response.data, g
                @registry[g.id] = g

            return g


        find: (id, params) ->
]