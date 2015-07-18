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

  function oie(){
    alert('beleza');
  }


  $scope.selectTab = function(setTab){
    alert('seelected ' + setTab);
    $scope.currentTab = setTab;
    $scope.saveTab();
  };

  $scope.gotoTab = function(setTab){
   // alert('xlabual');
    //$.get("/?page=1");
    window.location =  "/?page=1/?"+setTab+"";
    //load("https://www.google.com");
    //$($scope).load("/?page=1", oie);
   // window.location.href = ;
   // $scope.selectTab(setTab);
  };  

  $scope.isSelected = function(checkTab){
  	$scope.getTab();
  	// alert('is selected ' + checkTab + ' scope: ' + $scope.currentTab);
    return $scope.currentTab == checkTab;
  }




}]);
