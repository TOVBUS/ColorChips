import { Injectable } from '@nestjs/common';
import axios from 'axios';

@Injectable()
export class OpenAIService {
  private endpoint: string;
  private apiKey: string;

  constructor() {
    this.endpoint = 'https://chat-feofit.openai.azure.com/openai/deployments/gpt-4o-mini/chat/completions?api-version=2024-07-01-preview';
    this.apiKey = process.env.AZURE_OPENAI_API_KEY!;
  }

  async generateResponse(prompt: string): Promise<string> {
    try {
      const data = {
        messages: [
          { role: 'user', content: prompt }
        ],
        max_tokens: 1000
      };

      const response = await axios.post(this.endpoint, data, {
        headers: {
          'api-key': `${this.apiKey}`,
          'Content-Type': 'application/json',
        },
      });

      const completion = response.data.choices[0].message.content;
      return completion.trim();
    } catch (error) {
      console.error('Error:', error);
      throw new Error('Failed to generate response from OpenAI');
    }
  }
}