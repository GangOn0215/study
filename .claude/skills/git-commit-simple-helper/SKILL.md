---
name: git-commit-simple-helper
description: git diff를 분석해서 Conventional Commit 메시지를 자동으로 만들어줍니다. 사용자가 "커밋 심플 메시지 만들어줘", "커밋 심플", "commit simple", "git commit simple" 이라고 하면 이 스킬을 사용합니다.
---

# Git Commit Helper - 토큰 최적화 버전

## 워크플로우 (토큰 절약형)

### Step 1: 빠른 분석
```bash
# 파일 목록 + 변경 통계 (30-50 토큰)
git diff --cached --name-status --no-color
git diff --cached --shortstat --no-color
```

### Step 2: 파일명 기반 타입 추론
**자동 판단 규칙:**
- `src/components/`, `src/ui/` → feat(ui) 또는 style(ui)
- `src/api/`, `src/services/` → feat(api) 또는 fix(api)
- `test/`, `__tests__/`, `.spec.`, `.test.` → test
- `docs/`, `README`, `.md` → docs
- `package.json`, `requirements.txt` → chore(deps)
- `.github/workflows/`, `.gitlab-ci` → ci
- `.config.`, `webpack.`, `vite.` → chore(config)
- `refactor`, `utils`, `helpers` (파일명에) → refactor

### Step 3: 필요시만 상세 분석
**상세 diff가 필요한 경우:**
- 타입 추론 불확실 (80% 신뢰도 미만)
- 파일 3개 이하 + 변경 50줄 이하
- 사용자가 명시적으로 요청

**상세 diff 명령어:**
```bash
# context 최소화 (기본 3줄 → 1줄)
git diff --cached --unified=1 --no-color \
  -- ':(exclude)package-lock.json' \
     ':(exclude)yarn.lock' \
     ':(exclude)*.min.js'
```

### Step 4: 대화형 보완
불확실한 경우 1-2문장 질문:
- "API 엔드포인트를 추가한 건가요, 수정한 건가요?"
- "이 변경의 주요 목적이 뭔가요? (버그 수정/기능 추가/리팩토링)"

### Step 5: 커밋 메시지 생성
**포맷:**
```
<type>(<scope>): <subject>

<body - 선택적>

<footer - 선택적>
```

**타입 우선순위:**
1. feat - 새 기능
2. fix - 버그 수정
3. refactor - 코드 개선
4. chore - 기타 (빌드, 의존성)
5. docs - 문서
6. test - 테스트
7. style - 포맷팅
8. perf - 성능
9. ci - CI/CD

## 예시 실행

### 작은 변경 (최소 토큰)
```bash
$ git diff --cached --name-status
M  src/components/Button.tsx

$ git diff --cached --shortstat
1 file changed, 5 insertions(+), 2 deletions(-)
```
**Claude 판단:**
- UI 컴포넌트 수정
- 작은 변경
- 타입: feat 또는 fix

**메시지 생성:**
```
feat(ui): update button component styling

- adjust padding for better mobile UX
- fix hover state transition
```

### 중간 변경 (효율적)
```bash
$ git diff --cached --name-status
M  src/api/users.js
M  src/api/auth.js
A  src/api/tokens.js
M  test/api.test.js

$ git diff --cached --shortstat
4 files changed, 89 insertions(+), 12 deletions(-)
```

**Claude 판단:**
- API 관련 변경 (3파일)
- 테스트 추가
- 타입: feat(api)

**사용자에게 질문:**
"API 파일들에 토큰 인증 기능을 추가한 건가요?"
→ 사용자: "응"

**메시지 생성:**
```
feat(api): implement token-based authentication

- add token generation and validation logic
- update user and auth endpoints to use tokens
- add comprehensive test coverage
```

## 우리 팀 규칙
- Conventional Commits 엄격히 준수
- 제목: 소문자 시작, 마침표 없음, 72자 제한
- 본문: 왜 바꿨는지 명확히 (what은 diff로 알 수 있음)
- Breaking change는 반드시 footer에 명시

## 토큰 절약 팁
1. **대부분의 경우 --name-status면 충분**
2. 불확실할 때만 사용자에게 짧게 물어보기
3. 전체 diff는 최후의 수단
4. lock 파일, 빌드 결과물 무시