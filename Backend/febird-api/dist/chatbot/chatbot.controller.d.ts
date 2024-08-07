import { OpenAIService } from './openai.service';
export declare class ChatbotController {
    private readonly openAIService;
    constructor(openAIService: OpenAIService);
    generate(prompt: string): Promise<any>;
}
