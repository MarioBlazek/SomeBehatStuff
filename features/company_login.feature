Feature: Company login
  In order to see company profile
  As a company user
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
    When I fill in "Brukernavn" with "user@netgen-company.com"
    And I fill in "Passord" with "test"
    And I press "Logg inn"
    Then I wait for "10" seconds
    And I should be at URL "/u/profil"
    And I should see "Handverk/bygg/anlegg/mekanikk"
    And I follow "Logge ut"
    And I should be on homepage