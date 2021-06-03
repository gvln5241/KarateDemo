@DeleteAPIDemo
Feature: Delete API demo

  Scenario: Delete API Demo 1
    Given url 'https://reqres.in/api/users/2'
    When method Delete
    Then status 204
    And print response
