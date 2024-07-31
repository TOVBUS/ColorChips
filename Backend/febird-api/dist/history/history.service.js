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
exports.HistoryService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const history_entity_1 = require("./history.entity");
const member_entity_1 = require("../member/member.entity");
const level_entity_1 = require("../level/level.entity");
let HistoryService = class HistoryService {
    constructor(historyRepository, memberRepository, levelRepository) {
        this.historyRepository = historyRepository;
        this.memberRepository = memberRepository;
        this.levelRepository = levelRepository;
    }
    async create(createHistoryDto) {
        const { member_id, level_id, achievement_date } = createHistoryDto;
        const member = await this.memberRepository.findOne({
            where: { member_id },
        });
        if (!member) {
            throw new common_1.NotFoundException(`Member with ID ${member_id} not found`);
        }
        const level = await this.levelRepository.findOne({
            where: { level_id },
        });
        if (!level) {
            throw new common_1.NotFoundException(`Level with ID ${level_id} not found`);
        }
        const newHistory = this.historyRepository.create({
            achievement_date,
            member,
            level,
        });
        return await this.historyRepository.save(newHistory);
    }
    async findAll() {
        return await this.historyRepository.find({
            relations: ['member', 'level'],
        });
    }
};
exports.HistoryService = HistoryService;
exports.HistoryService = HistoryService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(history_entity_1.History)),
    __param(1, (0, typeorm_1.InjectRepository)(member_entity_1.Member)),
    __param(2, (0, typeorm_1.InjectRepository)(level_entity_1.Level)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository,
        typeorm_2.Repository])
], HistoryService);
//# sourceMappingURL=history.service.js.map