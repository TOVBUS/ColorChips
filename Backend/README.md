# Febird API
이 프로젝트는 Febird 프로젝트를 위한 백엔드 API이며, NestJS를 사용하여 개발되었습니다.

## 환경
- Node.js 
- NestJS
- Docker
- Kubernetes
- Azure
    - App Services
    - Storage Accounts
    - AI Services

## 목차

- [사전 준비](#사전-준비)
- [설치](#설치)
- [애플리케이션 실행](#애플리케이션-실행)
- [테스트 실행](#테스트-실행)
- [프로젝트 구조](#프로젝트-구조)

## 사전 준비

프로젝트를 시작하기 전에 다음 소프트웨어가 설치되어 있는지 확인하세요:

- [Node.js](https://nodejs.org/) v18.20.2 (Docker 이미지 설정시 v20.15.0 LTS 버전으로 변경 필요)
- [pnpm](https://pnpm.io/) 9.1.1

## 설치

1. 저장소를 클론합니다:

```bash
git clone https://github.com/yourusername/febird.git
cd febird/Backend/febird-api
```

2. 의존성을 설치합니다:

```bash
pnpm install
```

## 애플리케이션 실행

개발 모드에서 애플리케이션을 시작하려면 다음 명령어를 실행하세요:

```bash
pnpm run start:dev
```
애플리케이션은 `http://localhost:3000`에서 실행됩니다.

## 테스트 실행

테스트를 실행하려면 다음 명령어를 사용하세요:

```bash
pnpm run test
```

엔드 투 엔드 테스트를 실행하려면:

```bash
pnpm run test:e2e
```

테스트 커버리지를 실행하려면:

```bash
pnpm run test:cov
```

## 프로젝트 구조

프로젝트 구조는 다음과 같습니다:

```
febird-api
├── README.md
├── nest-cli.json
├── node_modules
├── package.json
├── pnpm-lock.yaml
├── src
│   ├── app.controller.spec.ts
│   ├── app.controller.ts
│   ├── app.module.ts
│   ├── app.service.ts
│   └── main.ts
├── test
│   ├── app.e2e-spec.ts
│   └── jest-e2e.json
├── tsconfig.build.json
└── tsconfig.json
```

- **src**: 애플리케이션의 소스 코드를 포함합니다.
    - **app.controller.ts**: 주요 컨트롤러를 정의합니다.
    - **app.module.ts**: 애플리케이션의 루트 모듈입니다.
    - **app.service.ts**: 핵심 기능을 제공합니다.
    - **main.ts**: 애플리케이션의 진입점입니다.
- **test**: 테스트 파일을 포함합니다.
    - **app.e2e-spec.ts**: 엔드 투 엔드 테스트입니다.

## 추가 자료

NestJS 사용 방법에 대한 자세한 내용은 [NestJS 문서](https://docs.nestjs.com/)를 참조하세요.

문제가 발생하거나 질문이 있으면 팀에 문의하거나 저장소에 이슈를 열어주세요.
