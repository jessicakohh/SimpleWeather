# SimpleWeather

Simple Weather 날씨 앱입니다.  
제1회 iOS 1인 해커톤 - with 루나 at the 앨런 스쿨에 참가하였습니다.  
대회 참가 기간: 2022년 10월 5일 ~ 2022년 10월 11일  
  
    
    

개발 환경 및 라이브러리
=========
* Swift 5.7
* Xcode 14.0.1
* UIKit
* MVC 
* CocoaPods



구현 기능 (동작 화면)
=========
1. 사용자가 앱을 클릭하면 스플래쉬 화면을 먼저 보여준다.
2. 사용자가 앱을 처음으로 실행했을 때 위치 정보 허용 알림창을 띄운다.
3. 사용자는 날씨 상세 화면에서 위치 정보 아이콘을 터치할 수 있다.
	*   위치 정보 사용 거부 시 : Alert 창을 띄워 “확인” 버튼 클릭 시 설정 화면으로 넘어갈 수 있게 한다.
	*  위치 정보 사용 허용 시 : GPS로 현재 위치를 받아와서, 현재 지역의 날씨 상세 정보를 보여준다.
4. 날씨 상세 화면에서 아래 정보를 나타낸다.
	*  지역 이름, 날씨 아이콘, 날씨 설명, 현재 기온, 현재 습도, 오늘의 최고/최저 기온
5. 사용자는 검색창을 이용하여 현재 지역을 변경할 수 있다. (키보드로 사용자가 글씨를 입력한다.)
6. 사용자는 Side Menu 에서 다음과 같은 항목들을 확인할 수 있다.
	* 문의하기, 개인정보 처리방침, 개발자 정보



대회 이후 개발 계획
=========
- Storyboard로 구현한 UI를 코드로 구현해 볼 예정입니다. 

