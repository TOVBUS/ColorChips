"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.OpenAIService = void 0;
const common_1 = require("@nestjs/common");
const axios_1 = require("axios");
let OpenAIService = class OpenAIService {
    constructor() {
        const baseUrl = process.env.AZURE_OPENAI_ENDPOINT;
        const deployment = process.env.AZURE_OPENAI_DEPLOYMENT;
        const apiVersion = process.env.AZURE_OPENAI_API_VERSION;
        this.endpoint = `${baseUrl}/openai/deployments/${deployment}/chat/completions?api-version=${apiVersion}`;
        this.apiKey = process.env.AZURE_OPENAI_API_KEY;
    }
    async generateResponse(prompt) {
        try {
            const data = {
                messages: [
                    { role: 'user', content: prompt }
                ],
                max_tokens: 1000
            };
            const response = await axios_1.default.post(this.endpoint, data, {
                headers: {
                    'api-key': `${this.apiKey}`,
                    'Content-Type': 'application/json',
                },
            });
            const completion = response.data.choices[0].message.content;
            return completion.trim();
        }
        catch (error) {
            console.error('Error:', error);
            throw new Error('Failed to generate response from OpenAI');
        }
    }
};
exports.OpenAIService = OpenAIService;
exports.OpenAIService = OpenAIService = __decorate([
    (0, common_1.Injectable)(),
    __metadata("design:paramtypes", [])
], OpenAIService);
//# sourceMappingURL=openai.service.js.map