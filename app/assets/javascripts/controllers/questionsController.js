app.controller('QuestionsController', ['$scope', function($scope) {
  $scope.currentTab = 1;

  $scope.selectTab = function(setTab){

    $scope.currentTab = setTab;
    
  };

  $scope.isSelected = function(checkTab){
    return $scope.currentTab === checkTab;
  }
}]);
