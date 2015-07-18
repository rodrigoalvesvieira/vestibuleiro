app.controller('QuestionsController', ['$scope', function($scope) {
 
  $scope.saveTab = function(){
  	localStorage.setItem('currentTab', $scope.currentTab);
  }

  $scope.getTab = function(){
  	$scope.currentTab = localStorage.getItem('currentTab');
  	if($scope.currentTab == null) {
  		$scope.currentTab = 1;
  		localStorage.setItem('currentTab', $scope.currentTab);
  	}
  }
  $scope.currentTab = $scope.getTab();

  $scope.selectTab = function(setTab){

    $scope.currentTab = setTab;
    $scope.saveTab();
  };

  $scope.isSelected = function(checkTab){
  	$scope.getTab();
  	alert('is selected ' + checkTab + ' scope: ' + $scope.currentTab);
    return $scope.currentTab == checkTab;
  }




}]);
