class HomeController < ApplicationController
  
  def index
  end
  
  def fake
    # 4. 추가처리
    
    # 1. 주소 설정하기
    url = "http://exam.com"
    
    # 2. api 호출하기
    response = nil
    
    # 3. api의 응답 부분 view로 호출
    @objects = []
  end
  
  def bithumb
    # 1. 주소 설정하기
    url = "http://주소"
    
    # 2. api 호출하기
    response = nil
    
    # 3. api의 응답 부분 view로 호출
    @coins = []
  end
  
  def place
    # 1. 주소 설정
    url = "http://주소"
    
    # 2. 쿼리 메세지 설정
    query = {
      
    }
    
    # 3. api 호출하기
    response = nil
    
    # 4. api의 응답 부분 view로 호출
    @place = {}
    
    # 5. 심화 코드 추가
    # api_result = GooglePlaceApi.new(params[:search], "key")
    
    # @images = api_result.image_urls
  end
end
