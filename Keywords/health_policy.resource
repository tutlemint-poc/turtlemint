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
    Wait Until Element Is Visible    ${health.pageheader.areyouplanningto}    ${SHORT_WAIT}    Are you planning to have kids ? page is \ not displayed
    ${loc_option}=    Update Dynamic Xpath    ${health.radiobtn.option}    ${option}
    Run Keyword If    '${option}'=='Yes'    Click Element    ${loc_option}
    Run Keyword If    '${option}'=='No'    Click on Next button

Does any of the member have any disease
    [Arguments]    ${option}
    Wait Until Element Is Visible    ${health.pageheader.doesanyofthemembers}
    ${loc_option}=    Update Dynamic Xpath    ${health.radiobtn.option}    ${option}
    Run Keyword If    '${option}'=='Yes'    Click Element    ${loc_option}
    Run Keyword If    '${option}'=='No'    Click on Next button

What is your pincode
    [Arguments]    ${pincode}
    Wait Until Element Is Visible    ${health.pageheader.whatisyourpincode}
    Input Text    ${health.text.pincode}    ${pincode}
    Click on Next button

Your prefered hospital
    Wait Until Element Is Visible    ${health.pageheader.yourpreffered}
    Click on Next button

What is your income bracket
    [Arguments]    ${income}
    Wait Until Element Is Visible    ${health.pageheader.whatisyourincomebracket}
    ${loc_income}=    Update Dynamic Xpath    ${health.radiobtn.income}    ${income}
    Click Element    ${loc_income}

Save your quote now
    [Arguments]    ${name}    ${mobile}    ${email}
    Wait Until Element Is Visible    ${health.pageheader.saveyourquote}
    Input Text    ${health.text.name}    ${name}
    Input Text    ${health.text.mobile}    ${mobile}
    Input Text    ${health.text.email}    ${email}
    Click on Next button

Select policy
