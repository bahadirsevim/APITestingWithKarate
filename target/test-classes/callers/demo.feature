Feature: Demo callers
  Scenario: Demo Scenario
    Given url myBaseUrl
    And path id
    When method GET
    Then print response