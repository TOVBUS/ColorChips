# Node.js 21.7.3 버전을 사용
FROM node:21.7.3

# 작업 디렉토리 설정
WORKDIR /app

# pnpm 설치
RUN npm install -g pnpm

# 종속성 파일 복사
COPY pnpm-lock.yaml ./
COPY package.json ./

# 종속성 설치
RUN pnpm install

# 소스 코드 복사
COPY . .

# 애플리케이션 빌드
RUN pnpm run build

# 애플리케이션 실행
CMD ["node", "dist/main"]