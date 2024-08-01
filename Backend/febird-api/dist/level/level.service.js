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
exports.LevelService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const level_entity_1 = require("./level.entity");
const routine_entity_1 = require("../routine/routine.entity");
let LevelService = class LevelService {
    constructor(levelRepository, routineRepository) {
        this.levelRepository = levelRepository;
        this.routineRepository = routineRepository;
    }
    async getRoutineById(routine_id) {
        const routine = await this.routineRepository.findOne({
            where: { routine_id },
        });
        if (!routine) {
            throw new common_1.NotFoundException(`Routine with ID ${routine_id} not found`);
        }
        return routine;
    }
<<<<<<< HEAD
    async findAll() {
        return this.levelRepository.find({ relations: ['routines'] });
    }
    async findOne(id) {
        const level = await this.levelRepository.findOne({
            where: { level_id: id },
            relations: ['routines'],
        });
        if (!level) {
            throw new common_1.NotFoundException(`Level with ID ${id} not found`);
        }
        return level;
=======
    async create(createLevelDto) {
        const routine = await this.getRoutineById(createLevelDto.routine_id);
        const level = this.levelRepository.create({
            ...createLevelDto,
            routines: [routine],
        });
        return this.levelRepository.save(level);
    }
    async findAll() {
        return this.levelRepository.find({ relations: ['routine'] });
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
    }
};
exports.LevelService = LevelService;
exports.LevelService = LevelService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(level_entity_1.Level)),
    __param(1, (0, typeorm_1.InjectRepository)(routine_entity_1.Routine)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], LevelService);
//# sourceMappingURL=level.service.js.map