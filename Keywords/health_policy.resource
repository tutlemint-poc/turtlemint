*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Select type of insurance
    [Arguments]    ${insurance_type}
    Wait Until Element Is Visible    ${home.radio.health}    ${LONG_WAIT}    Turtle Mint home page is not displayed
    Run Keyword If    '${insurance_type}'=='Health'    Click Element    ${home.radio.health}
    Run Keyword If    '${insurance_type}'=='Life'    Click Element    ${home.radio.life}
    ${loc_insurance_type}=    Run Keyword If    '${insurance_type}'=='Life'    Set Variable    ${home.radio.life}
    Click Element    ${home.button.getquote}

Select gender
    [Arguments]    ${gender}
    [Documentation]    Screen Tell us about yourself, you are a...
    Wait Until Element Is Visible    ${health.pageheader.gender}    ${MEDIUM_WAIT}    Gender page is not displayed
    ${loc_gender}=    Update Dynamic Xpath    ${health.radiobtn.gender}    ${gender}
    Click Element    ${loc_gender}

Who would you like to insure
    [Arguments]    ${members_to_be_insured}    # enter members by semi colon separator. Self;Wife;Father;Mother;Son;Daughter;Husband
    @{list_members}    Split String    ${members_to_be_insured}    separator=;
    Wait Until Element Is Visible    ${health.pageheader.whotoinsure}    ${MEDIUM_WAIT}    Who would you like to get insured? page is not displayed
    FOR    ${member}    IN    @{list_members}
        Select Checkbox    ${member}
    END
    Click on Next button

What is their age
    [Arguments]    ${relations_n_age}    # Self-35 years;Wife-33 years
    @{list_members}    Split String    ${relations_n_age}    separator=;
    FOR    ${member}    IN    @{list_members}
        @{age}    Split String    ${member}    separator=-
        ${dropdown_labelname}=    Get From List    ${age}    0
        ${dropdown_value}=    Get From List    ${age}    1
        Select from dropdown    ${dropdown_labelname}    ${dropdown_value}
    END
    Click on Next button

Are you planning to have kids
    [Arguments]    ${option}
    Wait Until Element Is Visible    ${radiobuttons.no}
    Click Element    ${radiobuttons.no}

Select policy

Does any of the member have any disease

What is your pincode

Your prefered hospital

What is your income bracket

Save your quote now
