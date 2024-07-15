// import { Injectable } from '@nestjs/common';
// import { OpenAIClient, AzureKeyCredential } from '@azure/openai';
// import * as dotenv from 'dotenv';

// dotenv.config();

// @Injectable()
// export class ChatbotService {
//   private client: OpenAIClient;
//   private deploymentId: string;

//   constructor() {
//     const endpoint = process.env.AZURE_OPENAI_ENDPOINT;
//     const azureApiKey = process.env.AZURE_OPENAI_KEY;
//     this.deploymentId = 'gpt-3'; // 임시로 작성함 test 해보고 결정
//     this.client = new OpenAIClient(
//       endpoint,
//       new AzureKeyCredential(azureApiKey),
//     );
//   }

//   async generateResponse(prompt: string): Promise<string[]> {
//     const result = await this.client.getChatCompletions(this.deploymentId, [
//       {
//         role: 'system',
//         // 멘트 정하고 작성하기
//         content: '',
//       },
//       { role: 'user', content: prompt },
//     ]);

//     return result.choices.map((choice) => choice.message.content);
//   }
// }
