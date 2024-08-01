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
exports.MemberController = void 0;
const common_1 = require("@nestjs/common");
const member_service_1 = require("./member.service");
const create_member_dto_1 = require("./dto/create-member.dto");
const update_member_dto_1 = require("./dto/update-member.dto");
const platform_express_1 = require("@nestjs/platform-express");
let MemberController = class MemberController {
    constructor(memberService) {
        this.memberService = memberService;
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
    async create(createMemberDto, file, res) {
        try {
            createMemberDto.profile_image = file.filename;
            const member = await this.memberService.create(createMemberDto);
            return res.status(common_1.HttpStatus.CREATED).json(member);
        }
        catch (error) {
            return res.status(common_1.HttpStatus.BAD_REQUEST).json({ message: '회원 정보 등록 실패' });
<<<<<<< HEAD
        }
    }
    async update(id, updateMemberDto, file, res) {
        try {
            if (file) {
                updateMemberDto.profile_image = file.filename;
            }
            const updatedMember = await this.memberService.update(id, updateMemberDto);
            return res.status(common_1.HttpStatus.OK).json(updatedMember);
        }
        catch (error) {
            return res.status(common_1.HttpStatus.BAD_REQUEST).json({ message: '회원 정보 수정 실패' });
        }
    }
    async findOne(id, res) {
        try {
            const member = await this.memberService.findOne(id);
            return res.status(common_1.HttpStatus.OK).json(member);
        }
        catch (error) {
            return res.status(common_1.HttpStatus.NOT_FOUND).json({ message: '회원을 조회 할 수 없습니다.' });
        }
    }
    async remove(id, res) {
        try {
            await this.memberService.remove(id);
            return res.status(common_1.HttpStatus.OK).json({ message: 'Member 삭제 성공!' });
        }
        catch (error) {
            return res.status(common_1.HttpStatus.BAD_REQUEST).json({ message: '회원 정보 삭제 실패' });
        }
=======
    create(createMemberDto, file) {
        createMemberDto.profile_image = file.filename;
        return this.memberService.create(createMemberDto);
    }
    update(id, updateMemberDto, file) {
        if (file) {
            updateMemberDto.profile_image = file.filename;
=======
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
        }
    }
<<<<<<< HEAD
    remove(id) {
        return this.memberService.remove(id);
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    async update(id, updateMemberDto, file, res) {
        try {
            if (file) {
                updateMemberDto.profile_image = file.filename;
            }
            const updatedMember = await this.memberService.update(id, updateMemberDto);
            return res.status(common_1.HttpStatus.OK).json(updatedMember);
        }
        catch (error) {
            return res.status(common_1.HttpStatus.BAD_REQUEST).json({ message: '회원 정보 수정 실패' });
        }
    }
    async findOne(id, res) {
        try {
            const member = await this.memberService.findOne(id);
            return res.status(common_1.HttpStatus.OK).json(member);
        }
        catch (error) {
            return res.status(common_1.HttpStatus.NOT_FOUND).json({ message: '회원을 조회 할 수 없습니다.' });
        }
    }
    async remove(id, res) {
        try {
            console.log(await this.memberService.remove(id));
            return res.status(common_1.HttpStatus.OK).json({ message: 'Member 삭제 성공!' });
        }
        catch (error) {
            return res.status(common_1.HttpStatus.BAD_REQUEST).json({ message: '회원 정보 삭제 실패' });
        }
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
    }
};
exports.MemberController = MemberController;
__decorate([
    (0, common_1.Post)(),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('profile_image')),
    __param(0, (0, common_1.Body)()),
    __param(1, (0, common_1.UploadedFile)()),
<<<<<<< HEAD
<<<<<<< HEAD
    __param(2, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_member_dto_1.CreateMemberDto, Object, Object]),
    __metadata("design:returntype", Promise)
=======
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_member_dto_1.CreateMemberDto, Object]),
    __metadata("design:returntype", void 0)
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    __param(2, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [create_member_dto_1.CreateMemberDto, Object, Object]),
    __metadata("design:returntype", Promise)
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
], MemberController.prototype, "create", null);
__decorate([
    (0, common_1.Patch)(':id'),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('profile_image')),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __param(2, (0, common_1.UploadedFile)()),
<<<<<<< HEAD
<<<<<<< HEAD
    __param(3, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, update_member_dto_1.UpdateMemberDto, Object, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "update", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "findOne", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", Promise)
=======
=======
    __param(3, (0, common_1.Res)()),
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, update_member_dto_1.UpdateMemberDto, Object, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "update", null);
__decorate([
    (0, common_1.Get)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "findOne", null);
__decorate([
    (0, common_1.Delete)(':id'),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
<<<<<<< HEAD
    __metadata("design:paramtypes", [Number]),
    __metadata("design:returntype", void 0)
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    __metadata("design:paramtypes", [Number, Object]),
    __metadata("design:returntype", Promise)
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
], MemberController.prototype, "remove", null);
exports.MemberController = MemberController = __decorate([
    (0, common_1.Controller)('member'),
    __metadata("design:paramtypes", [member_service_1.MemberService])
], MemberController);
//# sourceMappingURL=member.controller.js.map