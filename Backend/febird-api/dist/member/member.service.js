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
exports.MemberService = void 0;
const common_1 = require("@nestjs/common");
const typeorm_1 = require("@nestjs/typeorm");
const typeorm_2 = require("typeorm");
const member_entity_1 = require("./member.entity");
let MemberService = class MemberService {
    constructor(memberRepository) {
        this.memberRepository = memberRepository;
    }
    async create(createMemberDto) {
        const member = this.memberRepository.create(createMemberDto);
        return this.memberRepository.save(member);
    }
    async findOne(member_id) {
        const member = await this.memberRepository.findOne({ where: { member_id } });
        if (!member) {
            throw new common_1.NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
        }
        return member;
    }
    async findByAppleId(appleID) {
        console.log('Searching for member with appleID:', appleID);
        const member = await this.memberRepository.findOne({ where: { appleID } });
        return member;
    }
    async update(member_id, updateMemberDto) {
        await this.memberRepository.update(member_id, updateMemberDto);
        const updatedMember = await this.memberRepository.findOne({ where: { member_id } });
        if (!updatedMember) {
            throw new common_1.NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
        }
        return updatedMember;
    }
    async remove(member_id) {
        const result = await this.memberRepository.delete(member_id);
        if (result.affected === 0) {
            throw new common_1.NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
        }
    }
};
exports.MemberService = MemberService;
exports.MemberService = MemberService = __decorate([
    (0, common_1.Injectable)(),
    __param(0, (0, typeorm_1.InjectRepository)(member_entity_1.Member)),
    __metadata("design:paramtypes", [typeorm_2.Repository])
], MemberService);
//# sourceMappingURL=member.service.js.map