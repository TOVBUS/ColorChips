export declare class OpenAIService {
    private endpoint;
    private apiKey;
    constructor();
    generateResponse(prompt: string): Promise<string>;
}
