*** Variables ***
${home.radio.health}    //label[@class='select-type-health-desk']
${home.radio.life}    //label[@class='select-type-life-desk']
${home.button.getquote}    //div[@class="main-banner-txt"]/..//button[text()='Get a Quote']
${common.button.next}    //div[@id='Next']
${common.checkbox}    //label[contains(text(),'replaceText')]
${home.dropdown}    xpath=(//div[text()='replaceText']/..//button)[1]
${home.dropdown.open}    //div[@class="dropdown open"]//ul[@class='dropdown-menu noclose']
${home.dropdown.value}    //div[@class="dropdown open"]//a[text()='replaceText']
