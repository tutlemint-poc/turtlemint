*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Select type of insurance
    Wait Until Element Is Visible    ${radiobuttons.health}
    Click Element    ${radiobuttons.health}
    Wait Until Element Is Visible    ${button.getaquote}
    Click Element    ${button.getaquote}

Select gender
    Wait Until Element Is Visible    ${radiobuttons.male}
    Click Element    ${radiobuttons.male}

Who would you like to insure
    [Arguments]    ${insurer_name}
    Select Checkboxes    ${insurer_name}

What is their age
    [Arguments]    ${dropdown_id}    ${serach_age}
    Search and Select from dropdown    ${dropdown_id}    ${serach_age}

Are you planning to have kids
    Wait Until Element Is Visible    ${radiobuttons.no}
    Click Element    ${radiobuttons.no}

Select policy

Does any of the member have any disease

What is your pincode

Your prefered hospital

What is your income bracket

Save your quote now
