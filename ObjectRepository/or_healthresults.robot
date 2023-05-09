*** Variables ***
${healthresult.dropdown.cover}    //div[@class='filterpanel']/..//button[@id="filterCover"]
${health.result.dropdown.covervalue}    //a[@class="ng-binding" and contains(text(),'replaceText') ]/..//span[@class="ng-scope" and contains(text(),'Lakhs')]
${health.results.dropdown.selectinsurer}    //div[@class="insurance-for-button"]//button[@id="filterInsurer"]
${health.dropdown.selectinsurername}    //div[@class='dropdown filter1 open']//ul[@role='menu']/..//label[contains(text(),'replaceText')]
${health.header.coveramount}    //button[@id="filterCover"]
${health.dropdown.insurerlist}    //div[@class='dropdown filter1 open']//ul[@role='menu']
