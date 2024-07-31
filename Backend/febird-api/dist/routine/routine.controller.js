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
<<<<<<< HEAD
<<<<<<< HEAD
=======
const create_routine_dto_1 = require("./dto/create-routine.dto");
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
let RoutineController = class RoutineController {
    constructor(routineService) {
        this.routineService = routineService;
    }
<<<<<<< HEAD
<<<<<<< HEAD
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
=======
    create(createRoutineDto) {
        return this.routineService.create(createRoutineDto);
    }
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
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
<<<<<<< HEAD
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_routine_dto_1.CreateRoutineDto]),
    __metadata("design:returntype", void 0)
], RoutineController.prototype, "create", null);
__decorate([
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], RoutineController.prototype, "findAll", null);
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> c94d082 (✨ :: routine findOne 로직 추가 #KAN-257)
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", Promise)
], RoutineController.prototype, "findOne", null);
<<<<<<< HEAD
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> c94d082 (✨ :: routine findOne 로직 추가 #KAN-257)
exports.RoutineController = RoutineController = __decorate([
    (0, common_1.Controller)('routine'),
    __metadata("design:paramtypes", [routine_service_1.RoutineService])
], RoutineController);
//# sourceMappingURL=routine.controller.js.map