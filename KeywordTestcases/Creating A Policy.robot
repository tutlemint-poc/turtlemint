*** Settings ***
Resource          ../Global/super.robot
Resource          ../Global/global_variables.robot

*** Test Cases ***
TC01 Creating Health Policy
    Launch Browser and Navigate to URL    ${URL}    ${BROWSER_NAME}
<<<<<<< HEAD
    ${policy_data}=    Read TestData From Excel    TC_01    policy
    Select type of insurance    ${policy_data}[insurance_type]
    Select gender    ${policy_data}[gender]
    Who would you like to insure    ${policy_data}[members_to_be_ insured]
    What is their age    ${policy_data}[age]
    Are you planning to have kids    ${policy_data}[planning_to_have kids]
    Comment    When are you planning to have a child    ${policy_data}[when_are_you_planning_kids]
    Does any of the member have any disease    ${policy_data}[member_have_any_disease]
    What is your pincode    ${policy_data}[pincode]
    Your prefered hospital
    What is your income bracket    ${policy_data}[income_bracket]
    Save your quote now    ${policy_data}[name]    ${policy_data}[mobile]    ${policy_data}[email]
=======
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
>>>>>>> ravishyam
