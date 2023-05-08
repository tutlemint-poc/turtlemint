*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
    ${policy_data}=    Read TestData From Excel    TC_03    policy
    Create a Health Policy    ${policy_data}

sam
    ${member}    Create Dictionary    one=1    two=2
    ${status}    Run Keyword And Return Status    Dictionary Should Contain Key    ${member}    three
    ${test_val}    Set Variable If    ${status}==True    pass    ${EMPTY}
    Log    ${test_val}
    b
    ${members}    Set Variable    Self;Husband
    @{list_members}    Split String    ${members}    ;
    ${status}    Run Keyword And Return Status    Dictionary Should Contain Key    ${list_members}    when_are_you_planning_kids
