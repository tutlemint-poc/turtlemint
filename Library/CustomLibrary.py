from robot.libraries.BuiltIn import BuiltIn
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.support.ui import WebDriverWait
from selenium.webdriver.support import expected_conditions as EC
from selenium.webdriver.common.action_chains import ActionChains
import xlrd
import calendar
import time
import json
import datetime
import random as r
import string
import names
from PIL import Image,ImageChops
from datetime import timedelta, date
from appdirs import user_data_dir
from robot.api.deco import keyword

class CustomLibrary(object):

        def __init__(self):
                pass

        @property
        def _sel_lib(self):
            return BuiltIn().get_library_instance('SeleniumLibrary')

        @property
        def _driver(self):
            return self._sel_lib.driver
        
        def open_chrome_browser(self,url):
            """Return the True if Chrome browser opened """
            selenium = BuiltIn().get_library_instance('SeleniumLibrary')
            print(self.get_chrome_profile_path());
            try:                
                options = webdriver.ChromeOptions()
                options.add_argument("disable-extensions")                
                options.add_experimental_option("excludeSwitches",["enable-automation","load-extension"])
                #options.add_argument("user-data-dir=C:\\Users\\sande\\AppData\\Local\\Google\\Chrome\\User Data") #Path to your chrome profile
                options.add_argument("user-data-dir=" + self.get_chrome_profile_path()) #Path to your chrome profile
                selenium.create_webdriver('Chrome',chrome_options=options)
                selenium.go_to(url)                
            except Exception as e:
                raise e
      

        def javascript_click_by_xpath(self,xpath):
            element = self._driver.find_element_by_xpath(xpath) 
            self._driver.execute_script("arguments[0].click();", element)    

        def wait_until_time(self,arg):
                time.sleep(int(arg))
                
        def get_chrome_profile_path(self):
                chrome_profile_path= user_data_dir('Chrome','Google') + '\\User Data'
                #chrome_profile_path = "C:/Users/Srihari/AppData/Local/Google/Chrome/user data"
                return chrome_profile_path
        @keyword   
        def get_ms_excel_row_values_into_dictionary_based_on_key(self,filepath,keyName,sheetName=None):
            """Returns the dictionary of values given row in the MS Excel file """
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            dictVar={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return dictVar
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            dictVar={}
            headersList=worksheet.row_values(int(0))
            for rowNo in range(1,int(noofrows)):
                rowValues=worksheet.row_values(int(rowNo))
                if str(rowValues[0])!=str(keyName):
                    continue
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue                    
                    cell_data=self.get_unique_test_data(cell_data)
                
                    dictVar[str(headersList[rowIndex])]=str(cell_data)
            return dictVar

        def get_all_ms_excel_row_values_into_dictionary(self,filepath,sheetName=None):
            """Returns the dictionary of values all row in the MS Excel file """
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            all_row_dict={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return all_row_dict
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            headersList=worksheet.row_values(int(0))
            for rowNo in range(1,int(noofrows)):
                each_row_dict={}
                rowValues=worksheet.row_values(int(rowNo))
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue
                    cell_data=self.get_unique_test_data(cell_data)
                    each_row_dict[str(headersList[rowIndex])]=str(cell_data)
                all_row_dict[str(rowValues[0])]=each_row_dict
            return all_row_dict
        
        def get_all_ms_excel_matching_row_values_into_dictionary_based_on_key(self,filepath,keyName,sheetName=None):
            """Returns the dictionary of matching row values from the MS Excel file based on key"""
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            all_row_dict={}
            if sheetName==None:
                sheetName=snames[0]      
            if self.validate_the_sheet_in_ms_excel_file(filepath,sheetName)==False:
                return all_row_dict
            worksheet=workbook.sheet_by_name(sheetName)
            noofrows=worksheet.nrows
            headersList=worksheet.row_values(int(0))
            indexValue=1
            for rowNo in range(1,int(noofrows)):
                rowValues=worksheet.row_values(int(rowNo))
                if str(rowValues[0])!=str(keyName):
                    continue
                each_row_dict={}
                for rowIndex in range(0,len(rowValues)):
                    cell_data=rowValues[rowIndex]
                    if(str(cell_data)=="" or str(cell_data)==None):
                        continue
                    cell_data=self.get_unique_test_data(cell_data)
                    each_row_dict[str(headersList[rowIndex])]=str(cell_data)
                all_row_dict[str(indexValue)]=each_row_dict
                indexValue+=1
            return all_row_dict

        def get_unique_test_data(self,testdata):
            """Returns the unique if data contains unique word """
            ts = calendar.timegm(time.gmtime())
            unique_string=str(ts)
            testdata=testdata.replace("UNIQUE",unique_string)
            testdata=testdata.replace("Unique",unique_string)
            testdata=testdata.replace("unique",unique_string)
            if testdata != None and "RANDOM_EMAILID" in testdata:
                    email=self.get_email_address()
                    testdata=testdata.replace("RANDOM_EMAILID",email)
            if testdata != None and "RANDOM_PHONENUMBER" in testdata:
                    phno=self.get_phone_number()
                    testdata=testdata.replace("RANDOM_PHONENUMBER",phno)
            if testdata != None and "RANDOM_NAME" in testdata:
                    fullname=self.get_rnd_full_name()
                    testdata=testdata.replace("RANDOM_NAME",fullname)
            if testdata != None and "RANDOM_NAME_FEMALE" in testdata:
                    fullname=self.get_rnd_full_name('female')
                    testdata=testdata.replace("RANDOM_NAME_FEMALE",fullname) 
            return testdata

        def validate_the_sheet_in_ms_excel_file(self,filepath,sheetName):
            """Returns the True if the specified work sheets exist in the specifed MS Excel file else False"""
            workbook = xlrd.open_workbook(filepath)
            snames=workbook.sheet_names()
            sStatus=False        
            if sheetName==None:
                return True
            else:
                for sname in snames:
                    if sname.lower()==sheetName.lower():
                        wsname=sname
                        sStatus=True
                        break
                if sStatus==False:
                    print ("Error: The specified sheet: "+str(sheetName)+" doesn't exist in the specified file: " +str(filepath))
            return sStatus

        def get_future_date(self,futuredate):
                end_date = date.today() + timedelta(days=futuredate)
                return end_date.strftime("%d")
        
        def compare_images(self,expected_file_path,actual_image_path,):
            actual_image = Image.open(actual_image_path)
            expected_image = Image.open(expected_file_path)
            diff = ImageChops.difference(expected_image, actual_image)
            print(diff)
            if list(actual_image.getdata()) == list(expected_image.getdata()):
                    print ("Identical")
                    return False
            else:
                print ("Different")
                return True

        def wait_until_element_clickable(self,locator):
            """ An Expectation for checking that an element is either invisible or not present on the DOM."""
            if locator.startswith("//") or locator.startswith("(//"):
               WebDriverWait(self._driver, 60).until(EC.element_to_be_clickable((By.XPATH, locator)))
            else:
               WebDriverWait(self._driver, 60).until(EC.element_to_be_clickable((By.ID, locator)))

        def wait_until_element_displayed(self,locator):
            if locator.startswith("//") or locator.startswith("(//"):
               WebDriverWait(self._driver, 60).until(EC.presence_of_element_located((By.XPATH, locator)))
            else:
               WebDriverWait(self._driver, 60).until(EC.presence_of_element_located((By.ID, locator)))

        def mouse_move_by_offset(self):
            """ Mouse move to 0,0 """
            action = ActionChains(self._driver) 
            action.move_by_offset(0,10)
            action.perform()
            time.sleep(2)

        def get_rnd_first_name(self):
                firstname = names.get_first_name()
                print (firstname)
                return firstname

        def get_rnd_last_name(self):
                lastname = names.get_last_name()
                print (lastname)
                return lastname
        def get_rnd_full_name(self,gender='male'):
                fullname=names.get_full_name(gender)
                print (fullname)
                return fullname

        def get_phone_number(self):
                ph_no='9'
                for i in range(1, 10):
                    ph_no+= str(r.randint(0, 9))
                print (ph_no)
                return ph_no

        def get_email_address(self):                
                res = ''.join(r.choice(string.ascii_letters) for x in range(10))
                res="AutoTest" + res + "@gmail.com"
                print (res)
                return res


        def get_health_policy_results(self):
                loc_policy_results = "//div[contains(@data-ng-repeat,'result in healthResultObj')and @class='result-card-wrapper ng-scope']"
                loc_single_policy= "//div[contains(@data-ng-repeat,'result in healthResultObj') and @class='result-card-wrapper ng-scope'][{}]"
                loc_policy_client = "//div[contains(@class,'clients-logo')]/img"
                loc_policy_plan_name = "//span[contains(@class,'planName')]"
                loc_policy_cover_amount = "//span[@class='bold ng-binding' and contains(@data-auto,'coverAmount')]"
                loc_policy_total_premium = "//span[contains(@data-auto,'totalPremium')]"
                loc_policy_cliam_settled = "//span[contains(@class,'bold ng-binding') and contains(@data-auto,'speedOfClaim')]"
                self.wait_until_element_displayed(loc_policy_results)
                items = len(self._driver.find_elements_by_xpath(loc_policy_results))
                print(items)
                dict_policies={}
                for counter in range(1,items+1):
                        loc_single_policy_updated = loc_single_policy.format(counter)
                        #get client name
                        loc_policy_client_updated = loc_single_policy_updated + loc_policy_client
                        ele = self._driver.find_element_by_xpath(loc_policy_client_updated)
                        client_name = ele.get_attribute("alt")
                        #get plan name
                        loc_policy_plan_name_updated = loc_single_policy_updated + loc_policy_plan_name
                        ele = self._driver.find_element_by_xpath(loc_policy_plan_name_updated)
                        plan_name = ele.get_attribute("tooltip")
                        #get cover amount
                        loc_policy_cover_amount_updated = loc_single_policy_updated + loc_policy_cover_amount
                        ele = self._driver.find_element_by_xpath(loc_policy_cover_amount_updated)
                        cover_amount = ele.text                        
                        cover_amount = cover_amount.replace("₹","").replace("Lakhs","").strip()
                        if (len(cover_amount)>0):                                
                                cover_amount = float(cover_amount)
                                cover_amount = int(cover_amount*100000)
                        else:
                                cover_amount=0
                        #get total premium
                        loc_policy_total_premium_updated = loc_single_policy_updated + loc_policy_total_premium
                        ele = self._driver.find_element_by_xpath(loc_policy_total_premium_updated)
                        total_premium = ele.text
                        total_premium= total_premium.replace("₹","").replace(",","").strip()
                        if (len(total_premium)>0):
                                total_premium=int(total_premium)
                        else:
                                total_premium=0
                        #get claim settled
                        loc_policy_cliam_settled_updated = loc_single_policy_updated + loc_policy_cliam_settled
                        ele = self._driver.find_element_by_xpath(loc_policy_cliam_settled_updated)
                        claim_settled = ele.text
                        claim_settled=claim_settled.replace("%","")
                        if (len(claim_settled)>0):
                                claim_settled = float(claim_settled)
                        else:
                                claim_settled=0
                        dict_policy = {'client_name':client_name, 'plan_name':plan_name,'cover_amount':cover_amount,'total_premium':total_premium,'claim_settled':claim_settled}
                        print(dict_policy)
                        dict_policies[counter]=dict_policy
                return dict_policies

        def get_company_code(self,dict_company,value):
                key_list = list(dict_company.keys())
                val_list = list(dict_company.values())
                position = val_list.index(value)
                key = key_list[position]
                return key
        
        def calculate_percentage(self,part_num,whole_num):
                print(part_num / whole_num)
                print((part_num / whole_num) * 100)
                percentage = round((part_num / whole_num) * 100)
                return percentage
        def convert_to_lakhs(self,amount):
            amount = amount.replace("₹","").replace("Lakhs","").replace("Lacs","").strip()
            if (len(amount)>0):
                amount = float(amount)
                amount = int(amount*100000)
            else:
                amount=0
            return amount
