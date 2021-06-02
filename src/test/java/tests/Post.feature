@PostAPI
Feature: Post API demo example

  Background: 
    * url 'https://reqres.in/api'
    * header Accept = 'application/json'
    * def projectPath = karate.properties['user.dir']
    #* def requestFilePath = projectPath + '/src/test/java/data/request1.json'
    * def requestBody = read('../data/request1.json')
    * print requestBody
    #* def outputFilePath = projectPath + '/src/test/java/data/response1.json'
    * def expectedOutput = read('../data/response2.json')
    * print expectedOutput

  #simple post example
  Scenario: Post demo 1
    Given url 'https://reqres.in/api/users'
    And request {"name":"VG","job":"QA"}
    When method POST
    Then status 201
    And print response
    And print response.id

  #Post operation with background
  Scenario: Post Demo 2
    Given path '/users'
    And request {"name":"VG","job":"QA"}
    When method POST
    Then status 201
    And print response
    And print response.id

  #Post operation with assertions
  Scenario: Post Demo 3
    Given path '/users'
    And request {"name":"VG","job":"QA"}
    When method POST
    Then status 201
    And print response
    And match response == {"createdAt": "#ignore", "name": "VG", "id": "#string", "job": "QA"}

  #Post with reading output file
  Scenario: Post Demo 4
    Given path '/users'
    And request {"name":"VG","job":"QA"}
    When method POST
    Then status 201
    And def outputFilePath = 'response1.json'
    And def expectedOutput = read(outputFilePath)
    And match response == expectedOutput
    # we can use $ instead of response for match operation
    And match $ == expectedOutput
    # error will come if we try to print $, we need to user response only to print.
    And print response

  #Post with reading input and output file
  Scenario: Post Demo 5
    Given path '/users'
    And request requestBody
    When method POST
    Then status 201
    And match response == expectedOutput
    And print response

  #Post with reading input and output file and updating the values in files
  Scenario: Post Demo 6
    Given path '/users'
    And set requestBody.job = 'Lead'
    And request requestBody
    When method POST
    Then status 201
    And match response != expectedOutput
    And print response
