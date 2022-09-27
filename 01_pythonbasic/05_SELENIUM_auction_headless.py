import time
from selenium import webdriver
from selenium.webdriver.common.by import By
from selenium.webdriver.common.keys import Keys
from selenium.webdriver.chrome.service import Service
 
#Colab에선 웹브라우저 창이 뜨지 않으므로 별도 설정한다.
 
options = webdriver.ChromeOptions()
options.add_argument('--headless')        # Head-less 설정
options.add_argument('--no-sandbox')
options.add_argument('--disable-dev-shm-usage')
driver = webdriver.Chrome('chromedriver', options=options)
 
#해당 url로 이동
url =  'http://itempage3.auction.co.kr/DetailView.aspx?itemno=C253239668'
driver.get(url)

# '구매후기' 버튼클릭
review_button = driver.find_element(By.CSS_SELECTOR, 'li#tap_moving_2 a')
review_button.click()

# 구매후기 확인 
elements = driver.find_elements(By.CSS_SELECTOR, 'ul.list__review p.text')
for element in elements:
  print( element.text )