Feature: Wrap Region Bugs
  In order to avoid making the same mistakes more than once
  As a wrap region developer
  I want to create a test for each bug

  Background:
    Given I am in buffer "*wrap-region*"
    And the buffer is empty
    And I insert "This is some text"
    And transient mark mode is active
    And there is no region selected

  Scenario: Switch buffers
    When I load the following:
      """
      (wrap-region-add-mode-specific-punctuations 'html-mode '("'"))
      (wrap-region-global-mode t)
      """
    And I start html-mode
    And I select "is some"
    And I press "'"
    Then I should see "'is some'"
    When I am in buffer "new-temp"
    And I am in buffer "*wrap-region*"
    When I select "is some"
    And I press "("
    Then I should see "'(is some'"
    And I should not see "'(is some)'"
