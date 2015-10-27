Feature: Edit employee profile
  In order to edit employee profile
  As a employee user
  I need to be able to log in, open employee edit form, fill in and submit data

  @javascript @edit
  Scenario: Login, create job and logout
    Given I am on "/u/login"
    When I fill in "Brukernavn" with "adrian@kifla.com"
    And I fill in "Passord" with "security"
    And I press "Logg inn"
    And I should be at URL "/u/profil"
    And I follow "Oppdater profil"
    # implementation needed for getting employee id from doctrine
    And I should be at edit employee page
    And I check "employee_regiontags_1"
    And I check "employee_regiontags_2"
    And I press "Gå til CV"
    And I wait for "5" seconds
    And I press "Oppdater profil"
    Then I should be at URL "/u/profil"
    And I should see "Sogn"
    And I should see "Sunnfjord"
    And I follow "Logge ut"
    And I should be on homepage