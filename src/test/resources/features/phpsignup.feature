Feature: New User Signup on PHP Travels
  As a new visitor to PHP Travels
  I want to create a new account
  So that I can log in and book my travel services

  Background:
    Given I am on the PHP Travels Signup page

  @Positive
  Scenario: Successful new user signup
    When I enter first name "John"
    And I enter last name "Doe"
    And I enter email "john.doe123@example.com"
    And I enter phone number "9876543210"
    And I enter password "Password@123"
    And I confirm password "Password@123"
    And I click on the Signup button
    Then I should see a confirmation message "Account created successfully"
    And I should be redirected to the Login page

  @Negative
  Scenario: Signup with existing email
    When I enter first name "Jane"
    And I enter last name "Smith"
    And I enter an existing email "existing.user@example.com"
    And I enter phone number "9876543210"
    And I enter password "Password@123"
    And I confirm password "Password@123"
    And I click on the Signup button
    Then I should see an error message "Email already exists"

  @Negative
  Scenario: Signup with mismatched passwords
    When I enter first name "Alex"
    And I enter last name "Brown"
    And I enter email "alex.brown@example.com"
    And I enter phone number "9876501234"
    And I enter password "Password@123"
    And I confirm password "WrongPassword@123"
    And I click on the Signup button
    Then I should see an error message "Passwords do not match"

  @Negative
  Scenario: Signup with missing mandatory fields
    When I leave the first name field empty
    And I enter last name "Miller"
    And I enter email "miller@example.com"
    And I enter phone number "9876523456"
    And I enter password "Password@123"
    And I confirm password "Password@123"
    And I click on the Signup button
    Then I should see a validation message "First name is required"
