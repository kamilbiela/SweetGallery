describe "GalleryListControllerSpec", ->

    $httpBackend = false


    beforeEach module 'SweetGalleryApp'


    beforeEach inject ($injector) -> 
        $httpBackend = $injector.get '$httpBackend' 


    afterEach ->
        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()   


    it 'Should get list of galleries', inject ($controller, $rootScope) ->
        $httpBackend.expectGET('/api/galleries').respond 200, [
            {_id: 1, name: "Gallery name 1", images: [{"_id":"i1","name":"Image name"}]}
            {_id: 2, name: "Gallery name 2", images: [{"_id":"i1","name":"Image name"}]}
        ]

        scope = $rootScope.$new()
        c = $controller "GalleryListController", {$scope: scope}

        expect(scope.galleries.length).toBe(0)
        
        $httpBackend.flush()

        expect(scope.galleries.length).toBe(2)


