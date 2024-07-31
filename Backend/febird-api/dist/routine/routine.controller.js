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
exports.RoutineController = void 0;
const common_1 = require("@nestjs/common");
const routine_service_1 = require("./routine.service");
let RoutineController = class RoutineController {
    constructor(routineService) {
        this.routineService = routineService;
    }
    findAll() {
        return this.routineService.findAll();
    }
    async findOne(id) {
        const routine = await this.routineService.findOne(id);
        if (!routine) {
            throw new common_1.NotFoundException(`ID ${id}에 해당하는 루틴을 찾을 수 없습니다.`);
        }
        return routine;
    }
};
exports.RoutineController = RoutineController;
__decorate([
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], RoutineController.prototype, "findAll", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], RoutineController.prototype, "findOne", null);
exports.RoutineController = RoutineController = __decorate([
    (0, common_1.Controller)('routine'),
    __metadata("design:paramtypes", [routine_service_1.RoutineService])
], RoutineController);
//# sourceMappingURL=routine.controller.js.map