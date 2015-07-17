app.controller('SearchController', ['$scope', function($scope) {
    $scope.searchInfo = {};

    $scope.performSearch = function(searchInfo) {
    };

    $scope.currentTab = 1;

    $scope.selectTab = function(setTab){
        $scope.currentTab = setTab;
    };

    $scope.isSelected = function(checkTab){
        return $scope.currentTab === checkTab;
    };
}]);
