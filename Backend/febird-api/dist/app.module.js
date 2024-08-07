"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.AppModule = void 0;
const common_1 = require("@nestjs/common");
const config_1 = require("@nestjs/config");
const member_module_1 = require("./member/member.module");
const database_module_1 = require("./database/database.module");
const history_module_1 = require("./history/history.module");
const inbody_module_1 = require("./inbody/inbody.module");
const level_module_1 = require("./level/level.module");
const routine_module_1 = require("./routine/routine.module");
const exercise_module_1 = require("./exercise/exercise.module");
const chatbot_module_1 = require("./chatbot/chatbot.module");
let AppModule = class AppModule {
};
exports.AppModule = AppModule;
exports.AppModule = AppModule = __decorate([
    (0, common_1.Module)({
        imports: [
            config_1.ConfigModule.forRoot({
                isGlobal: true,
            }),
            member_module_1.MemberModule,
            database_module_1.DatabaseModule,
            history_module_1.HistoryModule,
            inbody_module_1.InbodyModule,
            level_module_1.LevelModule,
            routine_module_1.RoutineModule,
            exercise_module_1.ExerciseModule,
            chatbot_module_1.ChatbotModule
        ],
    })
], AppModule);
//# sourceMappingURL=app.module.js.map