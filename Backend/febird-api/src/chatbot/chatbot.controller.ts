import { Controller, Post, Body } from '@nestjs/common';
import { OpenAIService } from './openai.service';

@Controller('chatbot')
export class ChatbotController {
  constructor(private readonly openAIService: OpenAIService) {}

  @Post('generate')
  async generate(@Body('prompt') prompt: string): Promise<any> {
    const result = await this.openAIService.generateResponse(prompt);
    return result;
  }
}