"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
const core_1 = require("@nestjs/core");
const app_module_1 = require("./app.module");
const dotenv = require("dotenv");
dotenv.config();
async function bootstrap() {
    const app = await core_1.NestFactory.create(app_module_1.AppModule);
    await app.listen(process.env.PORT || 3000);
    console.log(`Server is running on: ${await app.getUrl()}`);
    console.log('Environment variables:');
    console.log(`DB_HOST: ${process.env.DB_HOST}`);
    console.log(`DB_PORT: ${process.env.DB_PORT}`);
    console.log(`DB_USERNAME: ${process.env.DB_USERNAME}`);
    console.log(`DB_DATABASE: ${process.env.DB_DATABASE}`);
}
bootstrap();
//# sourceMappingURL=main.js.map