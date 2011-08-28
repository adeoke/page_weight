Feature: Flash page weight for initial url

    As a user
    I want to supply a url
    So that I can get the flash page weight details

    Scenario: supply valid url that contains images
        Given a valid url for a html page
        When I ask for the flash page weight
        Then the flash weight is supplied

    Scenario: get number of flash objects for a url that contains flash
        Given a valid url for a html page
        When I ask for the number of flash objects for that url
        Then the number of flash objects is supplied