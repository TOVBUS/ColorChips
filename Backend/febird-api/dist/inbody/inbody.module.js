"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.InbodyModule = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const inbody_entity_1 = require("./inbody.entity");
const inbody_service_1 = require("./inbody.service");
const inbody_controller_1 = require("./inbody.controller");
const member_module_1 = require("../member/member.module");
let InbodyModule = class InbodyModule {
};
exports.InbodyModule = InbodyModule;
exports.InbodyModule = InbodyModule = __decorate([
    (0, common_1.Module)({
        imports: [typeorm_1.TypeOrmModule.forFeature([inbody_entity_1.Inbody]), member_module_1.MemberModule],
        controllers: [inbody_controller_1.InbodyController],
        providers: [inbody_service_1.InbodyService],
        exports: [typeorm_1.TypeOrmModule],
    })
], InbodyModule);
//# sourceMappingURL=inbody.module.js.map