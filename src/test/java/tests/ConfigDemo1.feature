@configDemo
Feature: config demo

  Background: 
    * url baseURL
    * header Accept = 'application/json'

  Scenario: config demo 1
    Given print name

  #simple get example
  Scenario: Get Demo 1
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print responseStatus
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies
