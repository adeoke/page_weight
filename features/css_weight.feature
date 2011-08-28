Feature: CSS page weight for initial url

    As a user
    I want to supply a url
    So that I can get the CSS page weight details

    Scenario: supply valid url that contains CSS
        Given a valid url for a html page
        When I ask for the CSS weight
        Then the CSS weight is supplied

    Scenario: get number of CSS files for a url that contains CSS
        Given a valid url for a html page
        When I ask for the number of CSS files for that url
        Then the number of CSS files is supplied