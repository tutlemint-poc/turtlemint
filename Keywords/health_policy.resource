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
    [Arguments]    ${option}    ${planning_kids}=${EMPTY}
    Wait Until Element Is Visible    ${health.pageheader.areyouplanningto}    ${SHORT_WAIT}    Are you planning to have kids page is not displayed
    ${loc_option}=    Update Dynamic Xpath    ${health.radiobtn.option}    ${option}
    Click Element    ${loc_option}
    Run Keyword If    '${option}'=='Yes'    When are you planning to have a child    ${planning_kids}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${health.pageheader.areyouplanningto}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click on Next button

When are you planning to have a child
    [Arguments]    ${planning_option}
    Wait Until Element Is Visible    ${health.header.whenareyouplanningtohaveachild}    ${MEDIUM_WAIT}    When are you planning to have kids page is not diplayed.
    Run Keyword If    '${planning_option}'=='IN1YR'    Click Element    ${health.radio.within1year}
    Run Keyword If    '${planning_option}'=='IN3YRS'    Click Element    ${health.radio.1-3years}
    Run Keyword If    '${planning_option}'=='MORETHAN3YRS'    Click Element    ${health.radio.morethan3years}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${health.header.whenareyouplanningtohaveachild}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click on Next button

Does any of the member have any disease
    [Arguments]    ${option}    ${pincode}=${EMPTY}
    Wait Until Element Is Visible    ${health.pageheader.doesanyofthemembers}
    ${loc_option}=    Update Dynamic Xpath    ${health.radiobtn.option}    ${option}
    Click Element    ${loc_option}
    Run Keyword If    '${option}'=='Yes'    Wait Until Element Is Visible    ${health.pageheader.doesanyofthemembers}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${health.pageheader.doesanyofthemembers}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click on Next button

What is your pincode
    [Arguments]    ${pincode}
    Wait Until Element Is Visible    ${health.pageheader.whatisyourpincode}    ${SHORT_WAIT}
    Input Text    ${health.text.pincode}    ${pincode}
    Click on Next button

Your prefered hospital
    Wait Until Element Is Visible    ${health.pageheader.yourpreffered}
    Click on Next button

What is your income bracket
    [Arguments]    ${income}
    Wait Until Element Is Visible    ${health.pageheader.whatisyourincomebracket}
    Run Keyword If    '${income}'=='LESSTHAN2.5LAKHS'    Click Element    ${health.radio.incomelessthan2.5}
    Run Keyword If    '${income}'=='UPTO5LAKHS'    Click Element    ${health.radio.incomeupto5lakhs}
    Run Keyword If    '${income}'=='UPTO10LAKHS'    Click Element    ${health.radio.incomeupto10lakhs}
    Run Keyword If    '${income}'=='MORETHAN10LAKHS'    Click Element    ${health.radio.incomemorethan10lakhs}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    \    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click on Next button

Save your quote now
    [Arguments]    ${name}    ${mobile}    ${email}
    Wait Until Element Is Visible    ${health.pageheader.saveyourquote}
    Input Text    ${health.text.name}    ${name}
    Input Text    ${health.text.mobile}    ${mobile}
    Input Text    ${health.text.email}    ${email}
    Click on Next button

Create a Health Policy
    [Arguments]    ${policy_data}
    Select type of insurance    ${policy_data}[insurance_type]
    Select gender    ${policy_data}[gender]
    Who would you like to insure    ${policy_data}[members_to_be_ insured]
    What is their age    ${policy_data}[age]
    @{list_members}    Split String    ${policy_data}[members_to_be_ insured]    ;
    ${status}    Run Keyword And Return Status    Dictionary Should Contain Key    ${policy_data}    when_are_you_planning_kids
    ${when_are_you_planning_kids}    Set Variable If    ${status}==True    ${policy_data}[when_are_you_planning_kids]    ${EMPTY}
    Run Keyword If    'Wife' in @{list_members} or 'Husband' in @{list_members}    Are you planning to have kids    ${policy_data}[planning_to_have kids]    ${when_are_you_planning_kids}
    Does any of the member have any disease    ${policy_data}[member_have_any_disease]
    What is your pincode    ${policy_data}[pincode]
    Your prefered hospital
    What is your income bracket    ${policy_data}[income_bracket]
    Save your quote now    ${policy_data}[name]    ${policy_data}[mobile]    ${policy_data}[email]
