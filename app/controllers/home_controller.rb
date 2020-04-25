class HomeController < ApplicationController
  
  def index
    @posts = {
      "userId": 1,
      "id": 1,
      "title": "sunt aut facere repellat provident occaecati excepturi optio reprehenderit",
      "body": "quia et suscipit\nsuscipit recusandae consequuntur expedita et cum\nreprehenderit molestiae ut ut quas totam\nnostrum rerum est autem sunt rem eveniet architecto"
    }
    
    @users = {
        "id": 1,
        "name": "Leanne Graham",
        "username": "Bret",
        "email": "Sincere@april.biz",
        "address": {
          "street": "Kulas Light",
          "suite": "Apt. 556",
          "city": "Gwenborough",
          "zipcode": "92998-3874",
          "geo": {
            "lat": "-37.3159",
            "lng": "81.1496"
          }
        },
        "phone": "1-770-736-8031 x56442",
        "website": "hildegard.org",
        "company": {
          "name": "Romaguera-Crona",
          "catchPhrase": "Multi-layered client-server neural-net",
          "bs": "harness real-time e-markets"
        }
      }
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
