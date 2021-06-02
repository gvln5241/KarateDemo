@GetAPI
Feature: Get API demo example

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'

  #simple get example
  Scenario: Get Demo 1
    Given url 'https://reqres.in/api/users?page=2'
    When method GET
    Then status 200
    And print responseStatus
    And print response
    And print responseTime
    And print responseHeaders
    And print responseCookies

  #running with background
  Scenario: Get Demo 2
    Given path '/users?page=2'
    When method GET
    Then status 200
    And print responseStatus
    And print response

    #get with path and parameters
    Scenario: Get Demo 3
    Given path '/users'
    And param page = 2
    When method GET
    Then status 200
    And print responseStatus
    And print response
    And match response.data[0].first_name != null
    And assert response.data.length == 6
    And match $.data[3].id == 10
    
    
    
    