Feature: Test scenarios for exercise 1

  Background:
    Given i'm on the exercise 1 screen

  Scenario: Verify the number of values on the screen
    When i count the number of values
    Then i should see 5 values

   Scenario: Validate the value amounts to be greater than zero
     When i gather the amounts from values
     Then i should see all the amounts to be greater than zero

  Scenario: Validate the summation of values to be equal to total balance
    When i gather the amounts from values
    And i gather amount from total balance
    Then the total balance must be equal to the summation of Values

  Scenario: Verify the currency formats of all the values and total balance
    When i gather the amounts from values
    And i gather amount from total balance
    Then all the amounts should be preceded by dollar sign