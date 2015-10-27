Feature: Adding a new job
  In order to create job
  As a company user
  I need to be able to log in, open job form, fill in and submit data

  @javascript
  Scenario: Login, create job and logout
    Given I am on "/u/login"
    When I fill in "Brukernavn" with "user@netgen-company.com"
    And I fill in "Passord" with "test"
    And I press "Logg inn"
    And I should be at URL "/u/profil"
    And I should see "Handverk/bygg/anlegg/mekanikk"
    And I follow "Registrér ny stiling"
    And I should be at URL "/user-admin/register-job"
    And I fill in "job_heading" with "PHP Developer"
    And I check "job_jobtypes_1"
    And I check "job_jobtypes_2"
    And I check "job_jobtypes_3"
    And I select "Media/journalistikk/informasjon/PR" from "job_industrytags"
    And I fill in job text editor "PHP, Symfony2, eZPublish 5"
    And I fill in "job_externalLink" with "http://www.moj-posao.net/"
    And I check "same3"
    And I select "15" from "job_fromtime_date_day"
    And I select "6" from "job_fromtime_date_month"
    And I select "2015" from "job_fromtime_date_year"
    And I check "same4"
    And I select "30" from "job_totime_date_day"
    And I select "7" from "job_totime_date_month"
    And I select "2015" from "job_totime_date_year"
    And I wait for "10" seconds
    And I press "Lagre stillingsannonse"
    Then I should be at URL "/u/profil"
    And I should see "PHP Developer"
    And I should see "30.07.2015"
    And I follow "Logge ut"
    And I should be on homepage