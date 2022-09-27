# 쇼핑몰에서 후기 가져오기
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service

service = Service(executable_path="chromedriver.exe")
options = webdriver.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging'])
browser = webdriver.Chrome(service=service, options=options)

url = 'http://itempage3.auction.co.kr/DetailView.aspx?itemno=C253239668'
browser.get( url )

# '구매후기' 버튼클릭
review_button = browser.find_element(By.CSS_SELECTOR, 'li#tap_moving_2 a')
review_button.click()

# 구매후기 확인 
elements = browser.find_elements(By.CSS_SELECTOR, 'ul.list__review p.text')
for element in elements:
  print( element.text )