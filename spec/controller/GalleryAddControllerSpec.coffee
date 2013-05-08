describe "GalleryAddControllerSpec", ->

    $httpBackend = null
    $scope = null
    controller = null

    beforeEach module 'SweetGalleryApp'

    beforeEach inject ($injector, $controller, $rootScope) ->
        $httpBackend = $injector.get '$httpBackend' 
        $scope = $rootScope.$new()
        controller = $controller "GalleryAddController", {$scope: $scope}

    afterEach ->
        $httpBackend.verifyNoOutstandingExpectation()
        $httpBackend.verifyNoOutstandingRequest()   

    it 'Should save gallery with provided data and redirect', ->
        $httpBackend.expectPOST('/api/galleries', '{"name":"testname"}').respond 200, ''

        $scope.gallery =
            name: "testname"

        $scope.formSubmit()
        $httpBackend.flush()

        


