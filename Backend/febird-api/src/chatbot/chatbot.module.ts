import { Module } from '@nestjs/common';
import { ChatbotController } from './chatbot.controller';
import { OpenAIModule } from './openai.module';

@Module({
  imports: [OpenAIModule],
  controllers: [ChatbotController],
})
export class ChatbotModule {}