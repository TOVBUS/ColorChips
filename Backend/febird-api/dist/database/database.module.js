"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.DatabaseModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const config_1 = require("@nestjs/config");
const member_entity_1 = require("../member/member.entity");
const history_entity_1 = require("../history/history.entity");
const inbody_entity_1 = require("../inbody/inbody.entity");
const level_entity_1 = require("../level/level.entity");
const routine_entity_1 = require("../routine/routine.entity");
const exercise_entity_1 = require("../exercise/exercise.entity");
let DatabaseModule = class DatabaseModule {
};
exports.DatabaseModule = DatabaseModule;
exports.DatabaseModule = DatabaseModule = __decorate([
    (0, common_1.Module)({
        imports: [
            config_1.ConfigModule.forRoot({
                isGlobal: true,
            }),
            typeorm_1.TypeOrmModule.forRootAsync({
                imports: [config_1.ConfigModule],
                useFactory: (configService) => {
                    const host = configService.get('DB_HOST');
                    const port = configService.get('DB_PORT');
                    const username = configService.get('DB_USERNAME');
                    const password = configService.get('DB_PASSWORD');
                    const database = configService.get('DB_DATABASE');
                    if (!host || !port || !username || !password || !database) {
                        throw new Error('Database configuration is incomplete. Check your .env file.');
                    }
                    return {
                        type: 'mysql',
                        host,
<<<<<<< HEAD
                        port,
=======
                        port: parseInt(port, 3306),
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
                        username,
                        password,
                        database,
                        entities: [member_entity_1.Member, history_entity_1.History, inbody_entity_1.Inbody, level_entity_1.Level, routine_entity_1.Routine, exercise_entity_1.Exercise],
                        synchronize: true,
                    };
                },
                inject: [config_1.ConfigService],
            }),
            typeorm_1.TypeOrmModule.forFeature([
                member_entity_1.Member,
                history_entity_1.History,
                inbody_entity_1.Inbody,
                level_entity_1.Level,
                routine_entity_1.Routine,
                exercise_entity_1.Exercise,
            ]),
        ],
        exports: [typeorm_1.TypeOrmModule],
    })
], DatabaseModule);
//# sourceMappingURL=database.module.js.map