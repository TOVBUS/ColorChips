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
exports.InbodyService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const inbody_entity_1 = require("./inbody.entity");
const member_entity_1 = require("../member/member.entity");
let InbodyService = class InbodyService {
    constructor(inbodyRepository, memberRepository) {
        this.inbodyRepository = inbodyRepository;
        this.memberRepository = memberRepository;
    }
    async create(member_id, createInbodyDto) {
        const member = await this.memberRepository.findOne({
<<<<<<< HEAD
<<<<<<< HEAD
            where: { member_id: member_id },
        });
        if (!member) {
            throw new common_1.NotFoundException(`${member_id}에 해당하는 회원을 찾을 수 없습니다.`);
=======
            where: { member_id: createInbodyDto.member_id },
        });
        if (!member) {
            throw new common_1.NotFoundException(`Member with ID ${member_id} not found`);
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
            where: { member_id: member_id },
        });
        if (!member) {
            throw new common_1.NotFoundException(`${member_id}에 해당하는 회원을 찾을 수 없습니다.`);
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
        }
        const newInbody = this.inbodyRepository.create({
            ...createInbodyDto,
            member: member,
        });
        return await this.inbodyRepository.save(newInbody);
    }
    async findAll(memberId) {
        const member = await this.memberRepository.findOne({
            where: { member_id: memberId },
            relations: ['inbodies'],
        });
        if (!member) {
<<<<<<< HEAD
<<<<<<< HEAD
            throw new common_1.NotFoundException(`${memberId}에 해당하는 회원을 찾을 수 없습니다.`);
        }
        return member.inbodies;
    }
    async update(memberId, inbodyId, updateInbodyDto) {
        const inbody = await this.inbodyRepository.findOne({
            where: { inbody_id: inbodyId, member: { member_id: memberId } },
            relations: ['member'],
        });
        if (!inbody) {
            throw new common_1.NotFoundException(`${inbodyId}에 해당하는 인바디를 찾을 수 없습니다.`);
        }
        Object.assign(inbody, updateInbodyDto);
        return await this.inbodyRepository.save(inbody);
    }
=======
            throw new common_1.NotFoundException(`Member with ID ${memberId} not found`);
        }
        return member.inbodies;
    }
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
            throw new common_1.NotFoundException(`${memberId}에 해당하는 회원을 찾을 수 없습니다.`);
        }
        return member.inbodies;
    }
    async update(memberId, inbodyId, updateInbodyDto) {
        const inbody = await this.inbodyRepository.findOne({
            where: { inbody_id: inbodyId, member: { member_id: memberId } },
            relations: ['member'],
        });
        if (!inbody) {
            throw new common_1.NotFoundException(`${inbodyId}에 해당하는 인바디를 찾을 수 없습니다.`);
        }
        Object.assign(inbody, updateInbodyDto);
        return await this.inbodyRepository.save(inbody);
    }
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
};
exports.InbodyService = InbodyService;
exports.InbodyService = InbodyService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(inbody_entity_1.Inbody)),
    __param(1, (0, typeorm_1.InjectRepository)(member_entity_1.Member)),
    __metadata("design:paramtypes", [typeorm_2.Repository,
        typeorm_2.Repository])
], InbodyService);
//# sourceMappingURL=inbody.service.js.map