# Library 가져오기
from selenium import webdriver
from selenium.webdriver.chrome.service import Service
from webdriver_manager.chrome import ChromeDriverManager
from selenium.webdriver.common.by import By
import time

chrome_driver = ChromeDriverManager().install()
service = Service(chrome_driver)
driver = webdriver.Chrome(service=service)

# 네이버 로그인 페이지 접속
login_url = "https://nid.naver.com/nidlogin.login"
driver.get(login_url)

time.sleep(2)

# 아이디, 비밀번호 변수에 저장
my_id = "내아이디"
my_pw = "내비밀번호"

# 아이디, 비밀번호 입력
driver.execute_script("document.getElementsByName('id')[0].value = '" + my_id + "'") # driver.execute_script() 안에 자바스크립트 사용 가능
driver.execute_script("document.getElementsByName('pw')[0].value = '" + my_pw + "'")

time.sleep(1)

# 로그인 버튼 클릭
button = driver.find_element(By.ID, "log.login")
button.click()
time.sleep(1)

# 중고나라 접속
cafe_joong = "https://cafe.naver.com/joonggonara"
driver.get(cafe_joong)
time.sleep(1)

# '조던 판매 게시판' 클릭
menu = driver.find_element(By.ID, "menuLink2171")
menu.click()
time.sleep(1)

# 프레임 전환
# driver.switch_to.frame({frame name})
# 프레임 확인: 개발자 도구 → iframe 검색
driver.switch_to.frame("cafe_main")
time.sleep(1)

#  XPath란? 웹 페이지의 구조 최상단부터 태그를 타고 들어가, 해당 HTML 요소가 어디에 존재 하는 지를 나타내는 경로의 일종
xpath = "/html/body/div[1]/div/div[4]/table/tbody/tr[1]/td[1]/div[2]/div/a"

# 첫번째 글 클릭
writing = driver.find_element(By.XPATH, xpath)
writing.click()
time.sleep(1)

# 첫번째 글 제목 출력
subject = driver.find_element(By.CSS_SELECTOR, "h3.title_text").text
# 첫번째 글 내용 출력
content = driver.find_element(By.CSS_SELECTOR, "div.se-main-container").text
print(subject, content)

driver.close()