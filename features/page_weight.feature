Feature: Html page weight for initial url

    As a user
    I want to supply a url
    So that I can get the html page weight details

    Scenario: supply valid url for a html page
        Given a valid url for a html page
        When I ask for the urls page weight
        Then the weight of the html is supplied

    Scenario: supply valid url for all pageweight details
        Given a valid url for a html page
        When I ask for the page weight report for the specified url
        Then the report for the url is supplied
        