*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Create a Health Policy    ${policy_data}
    get_health_policy_results_data
    Get the default cover amount    10
    Select the policy company name from filters    Star Health
