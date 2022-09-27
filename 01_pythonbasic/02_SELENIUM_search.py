from selenium import webdriver
from selenium.webdriver.common.by import By # CSS선택자 서치 담당
from selenium.webdriver.common.keys import Keys # 키 관련 동작 담당
from selenium.webdriver.chrome.service import Service # 크롬드라이버의 동작 시작, 끝 담당

options = webdriver.ChromeOptions()
options.add_experimental_option('excludeSwitches', ['enable-logging']) # USB에 부착된~ 버그 로그 제거용

# webdriver
# 크롬을 기준으로 현재 사용하고 있는 버전에 맞춰서 webdriver를 다운로드
service = Service(executable_path="chromedriver.exe")
browser = webdriver.Chrome(service=service, options=options)

url = 'https://www.naver.com'
browser.get( url )

# 검색어 입력 후 엔터 입력
# element = browser.find_element(By.CSS_SELECTOR, 'input#query')
# element.send_keys('검색어')
# element.send_keys('\n')

# 검색어 입력 후 마우스 클릭
# 클릭 가능한 요소라면 클릭이 가능
input = browser.find_element(By.CSS_SELECTOR, 'input#query')
button = browser.find_element(By.CSS_SELECTOR, 'button#search_btn')
input.send_keys('검색어')
button.click()





input2 = browser.find_element(By.CSS_SELECTOR, 'input#nx_query')
input2.clear()
input2.send_keys('두번째 검색어')
#input2.send_keys('\n')
button2 = browser.find_element(By.CSS_SELECTOR, 'button.bt_search')
button2.click()
# browser.quit() 