Feature: Homepage
    In order to see a homepage
    As a website user
    I need to be able to open homepage

    Scenario: Display homepage
        Given I am on somewhere
        When I go to homepage
        Then I should see "Framtidsfylket AS"