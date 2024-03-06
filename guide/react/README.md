# styleguide

- [Flutter Style Guide][flutter]
- [React-Typescript Style Guide][react]
- [NestJS-Typescript Style Guide][nestjs]
  <br/>

# 주석

- VSCode의 plugin Comment Anchors 규칙을 따른다.
- 불필요한 주석을 사용하지 않는다.
- https://github.com/StarlaneStudios/vscode-comment-anchors

    <img width="600" src="https://github.com/dihisoft/styleguide/assets/138173291/6c35b41b-95fc-4835-a1d2-4a9a61ded345" />

- // 를 입력하면 자동완성으로 나오는 형태를 사용한다.
  <img width="600" src="https://github.com/dihisoft/styleguide/assets/138173291/ddecd688-2b92-45fe-8c6e-e57e3e7dc418" />

# Dihisoft Git Rule

## 목차

- [1. 브랜치 전략](#1-브랜치-전략)
  - [1-1. 브랜치 종류](#1-1-브랜치-종류)
  - [1-2. 브랜치 예시](#1-2-브랜치-예시)
- [2. 커밋 메시지 컨벤션](#2-커밋-메시지-컨벤션)
  - [2-1. 커밋 메시지 작성 규칙](#2-1-커밋-메시지-작성-규칙)
  - [2-2. 커밋 메시지 구조](#2-2-커밋-메시지-구조)
  - [2-3. 커밋 메시지 예시](#2-3-커밋-메시지-예시)
  - [2-4. 커밋 메시지 타입](#2-4-커밋-메시지-타입)
- [3. Pull Request, Code Review, Merge](#3-pull-request-code-review-merge)
  - [3-1. Pull Request](#3-1-pull-request)
  - [3-2. Code Review](#3-2-code-review)
    - [3-2-1. Frontend Code Review 범위](#3-2-1-frontend-code-review-범위)
    - [3-2-2. Backend Code Review 범위](#3-2-2-backend-code-review-범위)
  - [3-3. Merge](#3-3-merge)

## 1. 브랜치 전략

- 깃 브랜치를 효과적으로 관리하기 위한 워크플로우를 정의한다.
- 작업을 병렬로 진행할 때 개발 프로세스를 잘 반영할 수 있는 모델인 Git-flow를 사용한다.
- **{브랜치 종류}/{닉네임}/{지라 이슈 이름}-{설명} 의 형태로 작성한다.**
- **{설명}은 간단하게라도 입력하고, 상황에 따라서 생략할 수 있다.**
- **develop 브랜치로 직접적인 커밋, 푸시는 금지한다.**

  ### 1-1. 브랜치 종류

  - master : 제품으로 출시될 수 있는 브랜치
  - hotfix : 출시 버전에서 발생한 버그를 수정 하는 브랜치
  - release : 이번 출시 버전을 준비하는 브랜치
  - develop : 다음 출시 버전을 개발하는 브랜치
  - feature : 기능을 개발하는 브랜치
    <br>
    <img width="600px" src="https://github.com/dihisoft/styleguide/assets/138173291/a35d9459-ae4f-4031-9e17-6412067d698c" />

  ### 1-2. 브랜치 예시

  - master
  - develop
  - **feature/tikim/dihi-794-sms**
  - **hotfix/mykim/dihi-800-login-error**
  - **hotfix/tikim/dihi-801-회원-목록**

## 2. 커밋 메시지 컨벤션

- 코드를 작성하다 보면 이전 코드를 참고하거나 롤백하는 경우가 있는데, 커밋 수가 많아지면 원하는 시점을 찾거나 참고해야 하는 경우에 어려움이 발생함
- 일관된 커밋 메시지를 작성함으로써 모든 팀원이 충분히 이해할 수 있는 공통적인 커밋 메시지 컨벤션 필요성이 생김

  ### 2-1. 커밋 메시지 작성 규칙

  - 제목과 본문을 빈 행으로 구분한다.
  - 제목은 50글자 이내로 제한한다.
  - 제목의 첫 글자는 대문자로 작성한다.
  - 제목 끝에는 마침표를 넣지 않는다.
  - 제목은 명령문으로 사용하며 과거형을 사용하지 않는다.
  - 본문의 각 행은 72글자 내로 제한한다.
  - 어떻게 보다는 무엇과 왜를 설명한다.

  ### 2-2. 커밋 메시지 구조

  - 커밋 메시지는 Header, Body, Footer로 구성된다.
  - 이들은 빈 행으로 구분된다.
  - Header는 필수이며 맨 앞에 [지라 이슈 이름]을 고정으로 입력한다.
  - 타입은 해당 커밋의 성격을 나타내며, feat, fix, build, chore 등이 있다.
  - Body는 Header로 표현할 수 없는 상세한 내용을 담는다. (생략 가능)
  - Footer는 참조 정보들을 추가하는 용도로 사용되며 해결한 이슈 커밋의 ID, 해결하기 위해 참고한 커밋의 ID 등을 작성한다. (생략 가능)

  ### 2-3. 커밋 메시지 예시

  ```bash
  [DIHI-933] FEAT: 이미지 업로드 공통 컴포넌트 개발

  이미지 업로드 할 때 중복되는 코드가 계속 쌓이는 문제가 발생해서
  이를 공통으로 관리할 수 있는 컴포넌트를 개발하여 향후 유지보수성 증가

  Resolves: #DIHI-933
  See also: #DIHI-900, #DIHI-899
  ```

  ### 2-4. 커밋 메시지 타입

  | Type 키워드 | 사용 시점                                                             |
  | ----------- | --------------------------------------------------------------------- |
  | FEAT        | 새로운 기능 추가                                                      |
  | FIX         | 버그 수정                                                             |
  | DOCS        | 문서 수정                                                             |
  | STYLE       | 코드 스타일 변경 (코드 포매팅, 세미콜론 누락 등)기능 수정이 없는 경우 |
  | DESIGN      | 사용자 UI 디자인 변경 (CSS 등)                                        |
  | TEST        | 테스트 코드, 리팩토링 테스트 코드 추가                                |
  | REFACTOR    | 코드 리팩토링                                                         |
  | BUILD       | 빌드 파일 수정                                                        |
  | CI          | CI 설정 파일 수정                                                     |
  | PERF        | 성능 개선                                                             |
  | CHORE       | 빌드 업무 수정, 패키지 매니저 수정 (gitignore 수정 등)                |
  | RENAME      | 파일 혹은 폴더명을 수정만 한 경우                                     |
  | REMOVE      | 파일을 삭제만 한 경우                                                 |

## 3. Pull Request, Code Review, Merge

- 코드 일관성 유지 및 소프트웨어 품질 향상을 위해서 Pull Request -> Code Review -> Merge 단계를 거쳐서 코드를 관리한다.

  ### 3-1. Pull Request

  - 작업을 수행한 후에는 담당 리뷰어를 지정해서 Pull Request를 한다.
  - Pull Request를 만들 때 작업에 대한 내용을 상세히 기술한다.
  - **작업 효율성 향상을 위해서 본인이 작업한 내용을 테스트 한 후에 PR을 생성한다.**

    - 제목 → ‘[지라 이슈 이름] {작업의 제목}’붙여서 작성한다.

    ```bash
    [DIHI-794] 팝빌 SMS 작업
    ```

    - 내용 → 작업 내용과 스크린샷
    - 내용의 맨 아랫줄 → 해당 작업과 관련있는 사람들의 아이디를 앞에 ‘@’ 를 붙여서 작성한다.

    ```bash
    ## 작업내용
    ### 팝빌 SMS 연동 화면
    - 팝빌 SMS 연동 화면 마크업 작업
    - 팝빌 SMS 연동 팝업창 작업
    - 팝빌 리스트 API 연동

    ### 공통 컴포넌트 개발
    - 여러 페이지에 SMS가 중복으로 들어가있어서 중복 코드를 제거하고 공통 컴포넌트를 사용하도록 변경

    ## 스크린샷
    <img width="300px" src="/uploads/373e2aa3e8fd7932feecf3de7356e595/image.png" />
    <img width="300px" src="/uploads/19f9ab62befefe4bcad1a9097ad2740d/image.png" />

    @sungmin-H @taeinkim8935 (리뷰어 이외의 참조해야할 필요가 있는 경우 추가)
    ```

    <img style='border:1px' width="600px" src="https://github.com/dihisoft/styleguide/assets/138173291/ba650888-5c79-4f0c-9cba-9c2dd15542f4" />

  ### 3-2. Code Review

  - 코드 리뷰는 시간을 평소보다 많이 소비하지만, 다른 개발자들이 검토하는 과정에서 예상치 못한 오류와 발생 가능성을 찾아내고 프로젝트의 코드 스타일을 유지할 수 있다.
  - 코드에 대한 책임이 작성한 개인에게 있지 않고 우리 모두에게 있다는 문화를 조성할 수 있다.
  - 장점
    1. 소프트웨어 품질 향상
    2. 개발 규정 준수 향상
    3. 비용 절감
  - 단점
    1. 늦어지는 리뷰로 인한 생산성 저하
    2. 숙련된 개발자 필요
    3. 감정적인 영향
    4. 우선순위와 효율성
  - 코드 리뷰를 할 때는 왜 개선이 필요한지 이유를 충분히 설명하고, 리뷰 형태는 자유롭게 작성한다.
    - 좋은 예시
      - ”data 라는 이름은 현재 어떤 역할을 하고 있는 변수인지 의도를 알기 어렵네요. 사용자 정보를 담고 있다면 이와 관련된 userData 라는 변수명이 좋아보입니다.”
      - ”조건 처리 구문이 5개 이상 되니깐, 회사 코딩 컨벤션에 따라서 switch 문으로 변경해주세요.”
      - “자바스크립트에는 내장 메소드가 많은데 그 중 filter 메소드를 활용해보세요. 이렇게 수정하면 코드량을 많이 줄일 수 있어요.”
    - 안 좋은 예시
      - ”data 변수 말고 다른 변수명으로 하세요.”
      - ”if문 말고 switch문으로 작성하세요.”
      - “arr.filter(item ⇒ item & 2 ===0); 으로 수정하세요”
  - 리뷰 할 부분이 없다면 억지로 하지 말고 칭찬 피드백을 주는 것도 좋다.

    - 칭찬 피드백 예시
      - 코드량이 적당해서 보기 좋네요.
      - 함수, 변수명이 직관적이여서 너무 좋네요.

  ### 3-2-1. Frontend Code Review 범위

  - 코드 리뷰
  - 화면 보면서 테스트 진행 (선택사항)

  ### 3-2-2. Backend Code Review 범위

  - 코드리뷰
  - API 호출, 테이블 검토 등

### 3-3. Merge

- 리뷰어가 approve 한 경우, 자신의 Pull Request는 스스로 merge 한다.
- **merge 하기 전에는 ‘npm run build’ 같은 명령어를 수행해서 build 에러가 없는지 체크한 후 merge 한다.**

[flutter]: https://github.com/dihisoft/styleguide/tree/main/flutter
[react-typescript]: https://github.com/dihisoft/styleguide/tree/main/react-typescript
[nestjs-typescript]: https://github.com/dihisoft/styleguide/tree/main/nestjs-typescript
