Feature: Images page weight for initial url

    As a user
    I want to supply a url
    So that I can get the images page weight details

    Scenario: supply valid url that contains images
        Given a valid url for a html page
        When I ask for the images page weight
        Then the images weight is supplied

    Scenario: get number of images for a url that contains images
        Given a valid url for a html page
        When I ask for the number of images for that url
        Then the number of images is supplied