describe "GalleryListControllerSpec", ->

    $httpBackend = null
    $scope = null
    controller = null

    beforeEach module 'SweetGalleryApp'

    beforeEach inject ($injector, $controller, $rootScope) ->
        $httpBackend = $injector.get '$httpBackend' 

        $httpBackend.expectGET('/api/galleries').respond 200, [
            {id: 1, name: "Gallery name 1", thumbnail: {"id":"i1","name":"Image name"}}
            {id: 2, name: "Gallery name 2", thumbnail: null}
        ]

        $scope = $rootScope.$new()
        controller = $controller "GalleryListController", {$scope: $scope}

    afterEach ->
        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()   

    it 'constructor', ->
        expect($scope.galleries.length).toBe(0)
        $httpBackend.flush()
        expect($scope.galleries.length).toBe(2)

    it 'deleteGallery', ->
        $httpBackend.flush()

        $httpBackend.expectDELETE('/api/galleries/1').respond 200, {}
        $scope.deleteGallery $scope.galleries[0]
        $httpBackend.flush()



