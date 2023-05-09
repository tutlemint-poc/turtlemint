*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Create a Health Policy    ${policy_data}
    ${policy_results}    CustomLibrary.Get Health Policy Results
    Check the cover amount in policy results    500000    ${policy_results}
    Check the Filtered Insurance details are displayed    Manipal Cigna Health Insurance    ${policy_results}
