Feature: Flight Booking until Payment Confirmation
  As a registered user
  I want to search and book a flight
  So that I can confirm my travel itinerary successfully

  Background:
    Given I am logged into PHP Travels application

  @Positive
  Scenario: Successful flight booking and payment confirmation
    When I navigate to the Flight Booking page
    And I select "Hyderabad" as departure city
    And I select "Dubai" as destination city
    And I select departure date "2025-09-15"
    And I select return date "2025-09-25"
    And I select number of passengers as "2"
    And I click on the Search Flights button
    Then I should see a list of available flights

    When I choose the first available flight
    And I click on Continue Booking
    Then I should see the Passenger Details page

    When I enter passenger details:
      | FirstName | LastName | Email                  | Phone       |
      | John      | Doe      | john.doe@example.com   | 9876543210  |
      | Jane      | Doe      | jane.doe@example.com   | 9876501234  |
    And I click on Continue to Payment
    Then I should see the Payment Options page

    When I select payment method "Credit Card"
    And I enter card details:
      | CardNumber       | ExpiryDate | CVV |
      | 4111111111111111 | 12/28      | 123 |
    And I click on Pay Now
    Then I should see a booking confirmation message "Your flight has been booked successfully"
    And I should receive a booking reference number

  @Negative
  Scenario: Payment fails due to invalid card details
    When I search and select a flight from "Delhi" to "London" on "2025-10-01"
    And I enter valid passenger details
    And I select payment method "Credit Card"
    And I enter invalid card details:
      | CardNumber       | ExpiryDate | CVV |
      | 1234567890123456 | 01/20      | 999 |
    And I click on Pay Now
    Then I should see an error message "Payment failed. Please check your card details"

  @Negative
  Scenario: Flight search with invalid date range
    When I select "Mumbai" as departure city
    And I select "Singapore" as destination city
    And I select departure date "2025-09-20"
    And I select return date "2025-09-10"
    And I click on the Search Flights button
    Then I should see a validation message "Return date cannot be earlier than departure date"
