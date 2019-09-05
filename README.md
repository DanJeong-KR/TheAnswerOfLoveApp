# LoveAns - 사랑의 해답
이성적이고 현명한 사람도 사랑 앞에서는 판단력이 흐려지기 마련입니다. 그때 적절한 조언을 주기 위한 앱.<br> 친구들끼리 혹은, 술자리에서 재미로 해볼 수 있는 가볍게 즐길 수 있고 타로점을 볼 때처럼 조언이 찰떡같은 것이 특징! <br>
(Ex : 내가 그 사람을 좋아하는 건지 잘 모르겠어요 / Ans : 심장의 두근거림을 체크하세요.)
* 기간 : 2019.06.24 ~ 2019.06.28 (1주)
* 소속 : 개인프로젝트
* 역할 : iOS 앱개발 및 배포
* 사용기술 : Swift5, MotionProximity(아이폰 카메라 센서), CoreAnimation

### 설계 (마인드맵)
<a href="/assets/design.pdf" target="_blank"><img src="/assets/design.png"></a>

### [Commit Message 규칙](https://changsic.github.io/CommitMessage/)
* `feat` : 새로운 기능 추가
* `fix` : 버그 수정
* `docs` : 문서 수정
* `style` : 파일 그룹화, 세미콜론 누락, 코드 변경이 없는 경우
* `refactor` : 코드 리펙토링
* `test` : 테스트 코드, 리펙토링 테스트 코드 추가

### 스크린샷

<a href="/assets/firstPage.gif" target="_blank"><img src="/assets/firstPage.gif" alt="My Image" width="250"></a>
<a href="/assets/secondPage.gif" target="_blank"><img src="/assets/secondPage.gif" alt="My Image" width="250"></a>
<a href="/assets/thirdPage.gif" target="_blank"><img src="/assets/thirdPage.gif" alt="My Image" width="250"></a>

### 데모영상
<a href="https://youtu.be/OouobgPOPD0" target="_blank"><img src="/assets/thumnail.png"></a>

<br>

### 문제해결 아카이브
* 부가설명 없이도 사용자가 이해할 수 있는 UI로 깔끔하게 디자인 하고 싶다.
  * 부가설명이 없어지려면 직관적이어야 하므로 다음 화면으로 넘어가는 버튼은 두근거리는 애니메이션을 적용하여 사용자가 직관적으로 누르고 싶게 만들었다.
  * 되돌아가기 버튼은 화살표가 반대쪽으로 돌아가는 애니메이션을 적용해서 사용자가 직관적으로 뒤로 간다는 느낌이 들게 했다.
* 설레는 느낌과 사용자가 직관적으로 누르게 하고 싶은 버튼을 구현하기 위해 심장이 두근거리는 애니메이션을 구현하고 싶은데 어떻게 구현할까.
  * <strong>AnimationKeyFrame</strong>으로 애니메이션 중간 부분의 디테일을 작성할 수 있어서 두근거림을 표현할 수 있었다.
* 사용자가 조언을 받는데 평범하지 않고 특별한 조언을 받는 느낌을 주고 싶은데 어떻게 구현할까.
  * <strong>MotionProximity</strong>를 활용해서 사용자의 손을 아이폰 전면 센서를 통해 인식하게 하고 사용자가 아이폰에 손을 흔들면 조언을 받는 방식으로 사용자가 마법을 부리는 것과 같은 특별한 느낌을 줄 수 있다.

<br>
<br>

---

<br>
<br>


### 해커톤에 프로젝트 출품당시 소개글

사랑에 대해 고민하지 않는 사람이 있을까요?

사랑에 대해 걱정하지 않는 사람이 있을까요?

우리에게 적절한 조언이 필요할 때

 <center><strong>Love Ans 앱이 당신을 도와드립니다.</strong></center>

made by [씨기](https://changsic.github.io/), [어색혜지자](https://github.com/Jeon-heaji)

* ### 먼저 당신의 고민을 생각하세요.

<a href="https://user-images.githubusercontent.com/38423205/60310990-1fd67700-9990-11e9-861a-419e90ce1672.gif" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/60310990-1fd67700-9990-11e9-861a-419e90ce1672.gif" alt="My Image" width="250"></a>


* ### <center>생각을 정리했으면 손만 흔들어 주세요!</center>

<a href="https://user-images.githubusercontent.com/38423205/60311468-51e8d880-9992-11e9-99cd-5f4cc3364117.gif" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/60311468-51e8d880-9992-11e9-99cd-5f4cc3364117.gif" alt="My Image" width="250"></a>


* ### <center>그러면 신기한 마법의 책은 당신에게 적절한 조언을 줄 것입니다.</center>

<a href="https://user-images.githubusercontent.com/38423205/60311906-2f57bf00-9994-11e9-9680-82b2d32476d9.gif" target="_blank"><img src="https://user-images.githubusercontent.com/38423205/60311906-2f57bf00-9994-11e9-9680-82b2d32476d9.gif" alt="My Image" width="250"></a>


### <center>마음속에서 생각한 그 분에게 꽃을 보내세요 💐</center>
