Feature: Employee login
  In order to see employee profile
  As a employee user
  I need to be able to log in

  @javascript
  Scenario: Display login page
    Given I am on homepage
    When I follow "Logg inn"
    Then I should be at URL "/u/login"
    And I should see "Brukernavn"
    And I should see "Passord"
    And I should see "Hugs meg"
    And I should see "Gløymt passord?"
    And I should see "Logg inn"

  @javascript @login
  Scenario: Try to login and logout
    Given I am on "/u/login"
    When I fill in "Brukernavn" with "adrian@kifla.com"
    And I fill in "Passord" with "security"
    And I press "Logg inn"
    Then I wait for "10" seconds
    And I should be at URL "/u/profil"
    And I should see "Security analyst and hacker"
    And I should see "34 år (20.02.1981)"
    And I should see "Security"
    And I should see "CEH"
    And I should see "Doktorgrad"
    And I should see "Forsking/utvikling"
    And I should see "IKT/telekom/Internett"
    And I should see "Nordfjord"
    And I should see "Adrian Lamo"
    And I should see "055/555-555"
    And I follow "Logge ut"
    And I should be on homepage