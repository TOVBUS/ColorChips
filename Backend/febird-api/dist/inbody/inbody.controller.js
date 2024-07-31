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
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.InbodyController = void 0;
const common_1 = require("@nestjs/common");
const inbody_service_1 = require("./inbody.service");
const create_inbody_dto_1 = require("./dto/create-inbody.dto");
const update_inbody_dto_1 = require("./dto/update-inbody.dto");
let InbodyController = class InbodyController {
    constructor(inbodyService) {
        this.inbodyService = inbodyService;
    }
    create(memberId, createInbodyDto) {
        return this.inbodyService.create(+memberId, createInbodyDto);
    }
    findAll(memberId) {
        return this.inbodyService.findAll(+memberId);
    }
    update(memberId, inbodyId, updateInbodyDto) {
        return this.inbodyService.update(+memberId, +inbodyId, updateInbodyDto);
    }
};
exports.InbodyController = InbodyController;
__decorate([
    (0, common_1.Post)(),
    __param(0, (0, common_1.Param)('memberId')),
    __param(1, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, create_inbody_dto_1.CreateInbodyDto]),
    __metadata("design:returntype", void 0)
], InbodyController.prototype, "create", null);
__decorate([
    (0, common_1.Get)(),
    __param(0, (0, common_1.Param)('memberId')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], InbodyController.prototype, "findAll", null);
__decorate([
    (0, common_1.Patch)(':inbodyId'),
    __param(0, (0, common_1.Param)('memberId')),
    __param(1, (0, common_1.Param)('inbodyId')),
    __param(2, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Number, update_inbody_dto_1.UpdateInbodyDto]),
    __metadata("design:returntype", void 0)
], InbodyController.prototype, "update", null);
exports.InbodyController = InbodyController = __decorate([
    (0, common_1.Controller)('member/:memberId/inbody'),
    __metadata("design:paramtypes", [inbody_service_1.InbodyService])
], InbodyController);
//# sourceMappingURL=inbody.controller.js.map