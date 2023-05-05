*** Settings ***
Resource          ../Global/super.robot

*** Variables ***
${radiobuttons.male}    //div[text()='Male ']
${radiobuttons.health}    //label[@class='select-type-health-desk']
${radiobuttons.no}    //label[@id='preDiseaseStatusNoLabel']//span[@class='outer']
${radiobuttons.gender}    //div[text()='replaceText ']
