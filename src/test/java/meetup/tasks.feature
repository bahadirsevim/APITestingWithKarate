Feature: This feature includes tasks that we will solve today
  Background:
    Given url myBaseUrl

  @Smoke
  Scenario: get request and verify status
    And path '44'
    When method GET
    Then print response
    And status 200

  @Regression
  Scenario: Post request with data
    * def myBody =
    """
    {
       "title":"API",
       "body":"API ogrenmek ne guzel",
       "userId":"10",
    }
    """
    And request myBody
    When method POST
    Then print response
    And match response.id == '#number'
    And match response.title == myBody.title

  Scenario: External Json file
    And def myBody = read('classpath:data/post.json')
    And request myBody
    When method POST
    Then status 201
    And match response.id == '#present'
    And match response.title == myBody.title

  Scenario Outline: Outline basics <id>
    And path "<id>"
    When method GET
    Then print response
    And status 200
    Examples:
      |id|
      |25|
      |26|
      |27|

  Scenario Outline: Outline read from CSV - <number>
    And path <number>
    When method GET
    Then print response
    And status 200
    And match response.id == <number>
    Examples:
      | read('classpath:data/data.csv') |

  Scenario: Custom JS function
    * def myString = call read('classpath:data/generate.js') 5
    * def myRequestBody = read('classpath:data/post.json')
    And set myRequestBody.title = myString
    And request myRequestBody
    When method POST
    Then status 201
    And print response

  Scenario: Using Callers
    * def myCaller = call read('classpath:callers/demo.feature'){id:57}
    Then match myCaller.responseStatus == 200
    And match myCaller.response.id == 57

