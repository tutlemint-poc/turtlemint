*** Variables ***
${healthresult.dropdown.button.coveramount}    //button[@id="filterCover"]
${healthresult.dropdown.list.coveramount}    //button[@id="filterCover"]/../../div[@class='dropdown filter1 open']
${healthresult.dropdown.select.coveramount}    //button[@id="filterCover"]/../../div[@class='dropdown filter1 open']//a[text()='replaceText ']
${healthresult.dropdown.button.insurer}    //button[@id="filterInsurer"]
${healthresult.dropdown.list.insurer}    //button[@id="filterInsurer"]/../../div[@class='dropdown filter1 open']
${healthresult.dropdown.select.insurer}    //button[@id="filterInsurer"]/../../div[@class='dropdown filter1 open']//label[text()='replaceText']
${healthresult.header.coveramount}    //button[@id="filterCover"]/span[contains(@class,'ng-binding')]
${healthresult.pageheader}    resultPage
${healthresult.page.data.ready}    //div[@ng-repeat='pending in pendings']
${healthresult.page.filter.ready}    //div[contains(@data-ng-repeat,'result in healthResultObj') and @class='result-card-wrapper ng-scope ng-hide']
