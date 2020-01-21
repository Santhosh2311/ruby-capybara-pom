Feature: Blog

@Sanity @Regression
  Scenario: Cyclos demo valid authentication validation
    Given I visit cyclos demo page
    When I click "Sign in"
    And I login with credentials
      |userid|pass|
      |santhosh_amalraj|Soft$$123|
   And I should see title "Cyclos4 Communities"
   #And I Logout of Application

@Sanity
   Scenario: Cyclos demo Invalid authentication validation
     Given I visit cyclos demo page
     When I click "Sign in"
     And I login with credentials
      |userid|pass|
      |santhosh_amalraj|Soft123|
     And I validate message in page "The given name / password are incorrect. Please, try again."

  @Sanity @HomePage
  Scenario: Validate Cyclos Demo Home Page
    Given I visit cyclos demo page
    When I click "Sign in"
    And I login with credentials
      |userid|pass|
      |santhosh_amalraj|Soft$$123|
    And I should see title "Cyclos4 Communities"
    And i should see profile name as "santhosh_amalraj"
    #And I Logout of Application

