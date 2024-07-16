import { NestFactory } from '@nestjs/core';
import { AppModule } from './app.module';
import * as dotenv from 'dotenv';
dotenv.config();

async function bootstrap() {
  const app = await NestFactory.create(AppModule);
  await app.listen(3000);
  console.log(`Server is running on: ${await app.getUrl()}`);
  console.log('Environment variables:');
  console.log(`DB_HOST: ${process.env.DB_HOST}`);
  console.log(`DB_PORT: ${process.env.DB_PORT}`);
  console.log(`DB_USERNAME: ${process.env.DB_USERNAME}`);
  console.log(`DB_DATABASE: ${process.env.DB_DATABASE}`);
}

bootstrap();
