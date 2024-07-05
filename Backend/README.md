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

- [Node.js](https://nodejs.org/) v18.20.2 - Docker 이미지 설정시 v20.15.0 LTS 버전으로 변경
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
