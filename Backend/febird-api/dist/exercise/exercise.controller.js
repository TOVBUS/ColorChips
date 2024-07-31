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
exports.ExerciseController = void 0;
const common_1 = require("@nestjs/common");
const exercise_service_1 = require("./exercise.service");
<<<<<<< HEAD
<<<<<<< HEAD
=======
const create_exercise_dto_1 = require("./dto/create-exercise.dto");
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
let ExerciseController = class ExerciseController {
    constructor(exerciseService) {
        this.exerciseService = exerciseService;
    }
<<<<<<< HEAD
<<<<<<< HEAD
    findAll() {
        return this.exerciseService.findAll();
    }
    findOne(id) {
        return this.exerciseService.findOne(id);
    }
};
exports.ExerciseController = ExerciseController;
__decorate([
=======
    create(createExerciseDto) {
        return this.exerciseService.create(createExerciseDto);
    }
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
    findAll() {
        return this.exerciseService.findAll();
    }
    findOne(id) {
        return this.exerciseService.findOne(id);
    }
};
exports.ExerciseController = ExerciseController;
__decorate([
<<<<<<< HEAD
    (0, common_1.Post)(),
    __param(0, (0, common_1.Body)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_exercise_dto_1.CreateExerciseDto]),
    __metadata("design:returntype", void 0)
], ExerciseController.prototype, "create", null);
__decorate([
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
    (0, common_1.Get)(),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", []),
    __metadata("design:returntype", void 0)
], ExerciseController.prototype, "findAll", null);
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
], ExerciseController.prototype, "findOne", null);
<<<<<<< HEAD
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
exports.ExerciseController = ExerciseController = __decorate([
    (0, common_1.Controller)('exercise'),
    __metadata("design:paramtypes", [exercise_service_1.ExerciseService])
], ExerciseController);
//# sourceMappingURL=exercise.controller.js.map