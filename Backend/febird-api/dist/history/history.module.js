"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.HistoryModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const history_entity_1 = require("./history.entity");
const history_service_1 = require("./history.service");
const history_controller_1 = require("./history.controller");
const member_module_1 = require("../member/member.module");
const member_entity_1 = require("../member/member.entity");
const level_module_1 = require("../level/level.module");
const level_entity_1 = require("../level/level.entity");
let HistoryModule = class HistoryModule {
};
exports.HistoryModule = HistoryModule;
exports.HistoryModule = HistoryModule = __decorate([
    (0, common_1.Module)({
        imports: [
            typeorm_1.TypeOrmModule.forFeature([history_entity_1.History, member_entity_1.Member, level_entity_1.Level]),
            member_module_1.MemberModule,
            level_module_1.LevelModule,
        ],
        controllers: [history_controller_1.HistoryController],
        providers: [history_service_1.HistoryService],
        exports: [typeorm_1.TypeOrmModule],
    })
], HistoryModule);
//# sourceMappingURL=history.module.js.map