Feature: Edit company profile
  In order to edit comapny profile
  As a company user
  I need to be able to log in, open company edit form, fill in and submit data

  @javascript @edit
  Scenario: Login, create job and logout
    Given I am on "/u/login"
    When I fill in "Brukernavn" with "user@netgen-company.com"
    And I fill in "Passord" with "test"
    And I press "Logg inn"
    And I should be at URL "/u/profil"
    And I follow "Endre bedriftsprofil"
    # implementation needed for getting company id from doctrine
    And I should be at edit company page
    And I press "Gå til kontaktinformasjon"
    And I uncheck "company_regiontags_1"
    And I press "Registrer bedrifta di"
    And I wait for "5" seconds
    Then I should be at URL "/u/profil"
    And I should not see "Sogn"
    And I follow "Logge ut"
    And I should be on homepage


