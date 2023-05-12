*** Settings ***
Resource          ../Global/super.robot

*** Keywords ***
Read plan details in compare page
    [Arguments]    ${policy_num}
    Comment    Get Cover AMount
    ${loc_cover_amount}    Update Dynamic Xpath    ${healthcompare.coveramount}    ${policy_num}
    ${cover_amount}    Get Text    ${loc_cover_amount}
    ${cover_amount}    Convert To Lakhs    ${cover_amount}
    Comment    Get Plan Name
    ${loc_plan_name}    Update Dynamic Xpath    ${healthcompare.planname}    ${policy_num}
    ${plan_name}    Get Text    ${loc_plan_name}
    Comment    Get Premiun amount
    ${loc_premium_amt}    Update Dynamic Xpath    ${healthcompare.button.premiumamount}    ${policy_num}
    ${premium_amt}    Get Text    ${loc_premium_amt}
    ${premium_amt}    Convert displayed amount to integer    ${premium_amt}
    &{policy_details}    Create Dictionary    cover_amount=${cover_amount}    plan_name=${plan_name}    total_premium=${premium_amt}
    [Return]    ${policy_details}

Check policy details in results and compare page
    [Arguments]    ${results_policy}    ${compare_policy}
    Run Keyword And Continue On Failure    Should Be Equal    ${results_policy}[plan_name]    ${compare_policy}[plan_name]    Selected Policy name in results name and compare should be equal
    Run Keyword And Continue On Failure    Should Be Equal    ${results_policy}[cover_amount]    ${compare_policy}[cover_amount]    Cover Amount in results and compare should be matching
    Run Keyword And Continue On Failure    Should Be Equal    ${results_policy}[total_premium]    ${compare_policy}[total_premium]    Premium Amount in results and compare should be matching
