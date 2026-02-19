---
name: git-commit-helper
# prettier-ignore
description: git diff를 분석해서 Conventional Commit 메시지를 자동으로 만들어줍니다. 사용자가 "커밋 메시지 만들어줘", "커밋", "commit", "git commit", "커밋 좀"이라고 하면 이 스킬을 사용합니다.
---

# Git Commit Helper

## 워크플로우
1. `git diff --cached` 실행 (staged된 변경사항이 없으면 `git diff`)
2. 변경 내용을 분석 (추가/수정/삭제된 부분 파악)
3. 타입 결정: feat, fix, chore, refactor, docs, test, style, ci, perf
4. 제목 작성 (최대 72자, 명령형, 소문자 시작, 마침표 없음)
5. 본문 작성 (왜 바꿨는지, 어떤 변화가 있는지, breaking change 유무)
6. 필요하면 footer 추가 (Closes #123 등)

## 우리 팀 규칙
- 반드시 Conventional Commits 사용
- 제목: 소문자 시작, 끝에 마침표 금지
- 본문: 변경 동기와 부작용 설명