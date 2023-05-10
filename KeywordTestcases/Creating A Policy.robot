*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    health_policy
    Create a Health Policy    ${policy_data}
    Sleep    10s
    get_health_policy_results

TC02 Creating Life Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_02    life_policy
    Create a Life Policy    ${policy_data}
