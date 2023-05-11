*** Variables ***
${life.typeof.termplan}    //p[text()='Term Life Plans']/preceding-sibling::label
${life.pageheader.lifeinsurance}    //p[text()='Select type of Life insurance']    # Selecting type of life insurance
${life.pageheader.abouttheinsured}    //div[contains(@class,'slideHeader') and text()='Tell us about the Insured...']
${life.radiobtn.gender}    //label[text()='replaceText']
${life.radiobtn.tobacco}    //label[text()='replaceText']
${life.dropdown.annualincome}    //div[@name='maxIncome']
${life.dropdown.annualincome.value}    //li[text()='replaceText']
${life.input.calender}    //input[@class='sc-eNQAEJ jyGtOU']
${life.button.next}    //button[@class='sc-iqzUVk kzNtUu sc-cSHVUG iRMcGE']
${life.typeof.investment}    //p[text()='Investment & Tax Planning']/preceding-sibling::label
${life.typeof.savingforchild}    //p[text()='Saving For Child']/preceding-sibling::label
${life.typeof.pension}    //p[text()='Pension & Retirement']/preceding-sibling::label
${life.pageheader.sumassured}    //div[contains(@class,'slideHeader') and text()='Select the Sum Assured Amount']
${life.assured_amt.dropdown}    //div[@class='sc-eqIVtm cCBzET']
${life.text.name}    //input[@name='customerName']
${life.text.email}    //input[@name='paidUserEmail']
${life.text.mobile}    //input[@name='paidUserMobile']
${life.pageheader.saveyouruote}    //div[contains(@class,'slideHeader') and text()='Save your quote now']
${life.button.back}    //span[text()='Back']
${life.assured_amt.value}    //div[@class="sc-hzDkRC dDbdhS"]//ul[@class="sc-jhAzac bDmIfQ"]/..//li[contains(text(),'replaceText')]
${life.input.dateofbirth}    //div[contains(@class,'datepicker') and contains(@aria-label,'replaceText1') and text()='replaceText2']
${life.dropdown.calender}    //select[@class="sc-iQKALj gwKrYD"]/child::option[text()='replaceText']
