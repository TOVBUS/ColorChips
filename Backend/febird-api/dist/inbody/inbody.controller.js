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
<<<<<<< HEAD
<<<<<<< HEAD
const update_inbody_dto_1 = require("./dto/update-inbody.dto");
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
const update_inbody_dto_1 = require("./dto/update-inbody.dto");
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
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
<<<<<<< HEAD
<<<<<<< HEAD
    update(memberId, inbodyId, updateInbodyDto) {
        return this.inbodyService.update(+memberId, +inbodyId, updateInbodyDto);
    }
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    update(memberId, inbodyId, updateInbodyDto) {
        return this.inbodyService.update(+memberId, +inbodyId, updateInbodyDto);
    }
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
__decorate([
    (0, common_1.Patch)(':inbodyId'),
    __param(0, (0, common_1.Param)('memberId')),
    __param(1, (0, common_1.Param)('inbodyId')),
    __param(2, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Number, update_inbody_dto_1.UpdateInbodyDto]),
    __metadata("design:returntype", void 0)
], InbodyController.prototype, "update", null);
<<<<<<< HEAD
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
exports.InbodyController = InbodyController = __decorate([
    (0, common_1.Controller)('member/:memberId/inbody'),
    __metadata("design:paramtypes", [inbody_service_1.InbodyService])
], InbodyController);
//# sourceMappingURL=inbody.controller.js.map