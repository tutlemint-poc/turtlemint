*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Select type of Insurance
    [Arguments]    ${insurance_type}
    Wait Until Element Is Visible    ${home.radio.health}    ${LONG_WAIT}    Turtle Mint home page is not displayed
    Run Keyword If    '${insurance_type}'=='Health'    Click Element    ${home.radio.health}
    Run Keyword If    '${insurance_type}'=='Life'    Click Element    ${home.radio.life}
    ${loc_insurance_type}=    Run Keyword If    '${insurance_type}'=='Life'    Set Variable    ${home.radio.life}
    Click Element    ${home.button.getquote}

Select type of Life Insurance
    [Arguments]    ${life_insurance_type}
    Wait Until Element Is Visible    ${life.pageheader.lifeinsurance}    ${SHORT_WAIT}    Life type of Insurance is not displayed
    Comment    Click Element    ${life.typeof.termplan}
    Run Keyword If    '${life_insurance_type}'=='Term Life Plans'    Click Element    ${life.typeof.termplan}
    Run Keyword If    '${life_insurance_type}'=='Investment & Tax planning'    Click Element    ${life.typeof.investment}
    Run Keyword If    '${life_insurance_type}'=='Saving for Child'    Click Element    ${life.typeof.savingforchile}
    Run Keyword If    '${life_insurance_type}'=='Pension & Retirement'    Click Element    ${life.typeof.pension}

Tell us about the Insured
    [Arguments]    ${gender}    ${option_smokeorchew}    ${annual.inc}
    Wait Until Element Is Visible    ${life.pageheader.abouttheinsured}    ${MEDIUM_WAIT}    Insured page is not displayed
    ${loc_gender}=    Update Dynamic Xpath    ${life.radiobtn.gender}    ${gender}
    Click Element    ${loc_gender}
    Comment    Pending Automate Calender
    ${loc_option}=    Update Dynamic Xpath    ${life.radiobtn.tobacco}    ${option_smokeorchew}
    Click Element    ${loc_option}
    Comment    Select annual Income from dropdown.
    Annual Income    ${annual.inc}
    Date of Birth
    Click Next button

Select the Sum Assured Amount
    [Arguments]    ${assured_amount}
    Wait Until Element Is Visible    ${life.pageheader.sumassured}    ${MEDIUM_WAIT}    Summ assured page is not displayed
    Click Element    ${life.assured_amt.dropdown}
    ${loc_assured.amt}=    Update Dynamic Xpath    ${life.assured_amt.value}    ${assured_amount}
    Click Element    ${loc_assured.amt}
    Click Next button

Save your quote now
    [Arguments]    ${name}    ${mobile}    ${email}
    Wait Until Element Is Visible    ${life.pageheader.saveyouruote}    ${MEDIUM_WAIT}    Save your quote page is not displaed
    Input Text    ${life.text.name}    ${name}
    Input Text    ${life.text.mobile}    ${mobile}
    Input Text    ${life.text.email}    ${email}
    Click Next button

Create a Life Policy
    [Arguments]    ${policy_data}
    Select type of Insurance    ${policy_data}[insurance_type]
    Select type of Life Insurance    ${policy_data}[life_insurance_type]
    Tell us about the Insured    ${policy_data}[gender]    ${policy_data}[option_tobacco]    ${policy_data}[annual_income]
    Select the Sum Assured Amount    ${policy_date}[assured_amount]
    life_policy.Save your quote now    ${policy_data}[name]    ${policy_data}[mobile]    ${policy_data}[email]

Annual Income
    [Arguments]    ${annual_income}
    Wait Until Element Is Visible    ${life.pageheader.abouttheinsured}    ${MEDIUM_WAIT}    Insured page is not displayed
    Click Element    ${life.dropdown.annualinc}
    Comment    Select item from dropdown
    ${loc_annual.inc}=    Update Dynamic Xpath    ${life.annualinc.value}    ${annual_income}
    Click Element    ${loc_annual.inc}

Date of Birth
    Wait Until Element Is Visible    ${life.pageheader.abouttheinsured}    ${MEDIUM_WAIT}    Insured page is not displayed
    Click Element    ${life.input.calender}
    Wait Until Element Is Visible    ${life.dob.calender}
    Comment    ${loc_dateofbirth}=    CustomLibrary.Get Future Date    ${life.dob.calender}

Click Next button
    Click Button    ${life.button.next}

Click Back button
    Click Element    ${life.button.back}
