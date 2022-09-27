# - 크롬인 척을 넘어서 실제로 브라우저를 제어하여 데이터를 수집, 자동화 등을 하기 위한 패키지
# - 웹 브라우저를 원격 조작하는 도구
# pip install selenium
# https://chromedriver.chromium.org/downloads
# 내 버전에 맞는 크롬드라이버도 함께 설치합니다
# BS4으로 해결 할 수 없는 경우 (웹주소가 GET방식이 아닌 경우, 자바스크립트를 사용하는 동적 페이지의 경우) 
# 드라이버.find_element_by_css_selector("선택자")
# - 선택자로 페이지 요소 선택하기(단일)
# 드라이버.find_elements_by_css_selector("선택자")
# - 선택자로 페이지 요소 선택하기(다중)
# 요소.send_keys("텍스트")
# - 해당 요소에 문자 입력하기
# 요소.click()
# - 해당 요소 클릭하기

from selenium import webdriver
# 크롬드라이버 경로 지정
driver = webdriver.Chrome('./chromedriver.exe')

# get - 가고 싶은 주소로 이동
driver.get('https://naver.com')
# 종료
driver.quit()
