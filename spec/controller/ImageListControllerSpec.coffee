describe "ImageListControllerSpec - with images", ->

    $httpBackend = null
    $routeParams = null
    $scope = null
    controller = null

    beforeEach module 'SweetGalleryApp'

    beforeEach inject ($injector, $controller, $rootScope) ->
        $httpBackend = $injector.get '$httpBackend' 
        $routeParams = $injector.get '$routeParams'
        $routeParams.galleryId = 1

        $httpBackend.expectGET('/api/galleries/1').respond 200,
            id: 1
            name: 'Gallery name'
            images: [
                {id: 1, name: 'imagename'}
            ]

        $scope = $rootScope.$new()
        controller = $controller "ImageListController", 
            $scope: $scope
            $routeParams: $routeParams

    afterEach ->
        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()

    it 'Should get gallery with images', ->
        $httpBackend.flush()

    xit 'should invoke delete call api', ->
        setHttpBackendGet()
        $httpBackend.flush()
        #@todo
        $scope.deleteImage($scope.gallery.images[0])


