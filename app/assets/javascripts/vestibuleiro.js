'use strict';

var app = angular.module("Vestibuleiro", [
  'ngSanitize',
  'ui.router',
  'ngResource',
  'ngAnimate',
  'pascalprecht.translate',
  'ngCookies',
  'LocalStorageModule',
  'Vestibuleiro.controllers',
  'Vestibuleiro.services',
  'angular-loading-bar',
  'ui.date'
]);

app.config([
  '$stateProvider',
  '$urlRouterProvider',
  '$locationProvider',
  '$translateProvider',
  '$httpProvider',
  'localStorageServiceProvider',

  function($stateProvider, $urlRouterProvider, $locationProvider, $translateProvider, $httpProvider, localStorageServiceProvider) {

    // Enable CORS
    $httpProvider.defaults.useXDomain = true;

    // Local Storage config
    localStorageServiceProvider.setPrefix('Vestibuleiro');

    // I18n config
    $translateProvider.useUrlLoader('locales/pt_BR.json');
    $translateProvider.preferredLanguage('pt_BR');
  }
]);

app.controllers = angular.module("Vestibuleiro.controllers", []);
app.services = angular.module('Vestibuleiro.services', []);
app.apiServerUrl = window.location.origin;
