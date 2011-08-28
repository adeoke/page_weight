Feature: javascript page weight for initial url

    As a user
    I want to supply a url
    So that I can get the javascript page weight details

    Scenario: supply valid url that contains javascript
        Given a valid url for a html page
        When I ask for the javascript page weight
        Then the javascript weight is supplied

    Scenario: get number of javascript files for a valid url containing javascript
        Given a valid url for a html page
        When I ask for the number of javascript documents for that url
        Then the number of javascript documents is supplied