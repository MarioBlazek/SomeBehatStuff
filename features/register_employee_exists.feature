Feature: Register employee
  In order to register employee
  As a website user
  I need to be able to open employee form, fill in and submit data


  @javascript
  Scenario: Fill data in and register
    Given I am on "/registrer-arbeidssokar"
    # First page
    When I fill in "Førenamn" with "Adrian"
    And I fill in "Etternamn" with "Lamo"
    And I fill in "E-post" with "adrian@kifla.com"
    And I fill in "Mobil" with "055/555-555"
    And I fill in "Fagområde, eksempelvis \"Samfunnsvitenskap\"" with "Threat analyst"
    # problem with chrome
    And I check "employee_regiontags_3"
    And I check "employee_newsletter"
    And I check "employee_fairs_3"
    And I fill in "Velg passord" with "security"
    And I fill in "Gjenta passord" with "security"
    And I press "Gå til CV"
    # Second page
    And I fill in "Fødselsår" with "20/02/1981"
    And I select "3" from "employee[cv][education]"
    And I fill in "Hva jobber du med nå" with "Security compromise"
    And I fill in "Linkedin ID" with "none"
    And I wait for a while
    And I attach the file "logo.jpeg" to "employee_cv_cvFile_file"
    And I fill in "s2id_autogen2" with "IKT/telekom/Internett"
    And I fill in "s2id_autogen2" with "Forsking/utvikling"
    And I fill in "s2id_autogen1" with "Security"
    And I fill in "s2id_autogen1" with "CEH"
    And I select "1" from "employee[cv][jobNotification]"
    And I fill in "Fortell om deg selv" with "Security analyst and hacker"
    And I upload the file "logo.jpeg" to "employee_cv_photoFile_file"
    And I check "Eg godtek vilkåra"
    And I press "Registrer deg"
    # Check
    Then I wait for "10" seconds
    And I should be at URL "/registrer-arbeidssokar"
    And I should see "Verdien er allereie i bruk."