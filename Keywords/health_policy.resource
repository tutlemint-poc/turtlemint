*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Select type of insurance
    Wait Until Element Is Visible    ${radiobuttons.health}
    Click Element    ${radiobuttons.health}
    Wait Until Element Is Visible    ${button.getaquote}
    Click Element    ${button.getaquote}

Select gender
    Wait Until Element Is Visible    ${radiobutton.male}
    Click Element    ${radiobutton.male}

Who would you like to insure
    Wait Until Element Is Not Visible    ${pageheader.insurelistpage}
    Sleep    3s
    Click Element    ${checkboxes.self}
    Click Element    ${checkboxes.wife}

What is their age
    [Arguments]    ${dropdown_id}    ${serach_age}
    Search and Select from dropdown    ${dropdown_id}    ${serach_age}

Select policy

Save your quote now

Does any of the member have any disease

What is your income bracket

What is your pincode

Your prefered hospital
