*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Check Pop up Message
    Comment    Wait Until Element Is Visible    ${liferesults.message}    ${MEDIUM_WAIT}    Confirmation message is not displayed
    Comment    Click Element    ${liferesults.message}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${liferesults.message}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    Click Element    ${liferesults.message}

Get payment frequency from policy result
    Wait Until Element Is Visible    ${liferesults.header.paymentfrequency}    ${MEDIUM_WAIT}    Payment frequency is not displayed in life policy page
    ${payment_frequency}=    Get Text    ${liferesults.header.paymentfrequency}

Get sum assured from policy result
    [Arguments]    ${assured_amount}
    Wait Until Element Is Visible    ${liferesults.header.sumassured}    ${MEDIUM_WAIT}    Sum assured is not displayed is Life policy page
    ${sum_assured}=    Get Text    ${liferesults.header.sumassured}
    ${status}    Run Keyword And Return Status    Wait Until Element Is Visible    ${liferesults.header.sumassured}    ${SHORT_WAIT}
    Run Keyword If    ${status}==True    ${assured_amount}

Check premium amount
    Wait Until Element Is Visible    ${liferesults.header.premiumamount}    ${MEDIUM_WAIT}    Premium amount should be displayed in life policy page.
    ${premium_amount}=    Get Text    ${liferesults.header.premiumamount}
