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
const update_member_dto_1 = require("./dto/update-member.dto");
const platform_express_1 = require("@nestjs/platform-express");
const passport_1 = require("@nestjs/passport");
const auth_service_1 = require("../auth/auth.service");
let MemberController = class MemberController {
    constructor(memberService, authService) {
        this.memberService = memberService;
        this.authService = authService;
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
    }
    async appleLogin(appleID, res) {
        try {
            let member = await this.memberService.findByAppleId(appleID);
            if (!member) {
                member = await this.memberService.create({
                    appleID,
                });
            }
            const token = await this.authService.generateToken(member.member_id);
            return res.status(common_1.HttpStatus.OK).json({ token, member_id: member.member_id });
        }
        catch (error) {
            return res.status(common_1.HttpStatus.INTERNAL_SERVER_ERROR).json({
                message: '서버 오류로 애플 로그인 실패',
                error: error.message,
            });
        }
    }
    getProtected(req) {
        return { member_id: req.user.member_id };
    }
};
exports.MemberController = MemberController;
__decorate([
    (0, common_1.Patch)(':id'),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('profile_image')),
    __param(0, (0, common_1.Param)('id')),
    __param(1, (0, common_1.Body)()),
    __param(2, (0, common_1.UploadedFile)()),
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
], MemberController.prototype, "remove", null);
__decorate([
    (0, common_1.Post)('apple-login'),
    __param(0, (0, common_1.Body)('appleID')),
    __param(1, (0, common_1.Res)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [String, Object]),
    __metadata("design:returntype", Promise)
], MemberController.prototype, "appleLogin", null);
__decorate([
    (0, common_1.Get)('protected'),
    (0, common_1.UseGuards)((0, passport_1.AuthGuard)('jwt')),
    __param(0, (0, common_1.Request)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], MemberController.prototype, "getProtected", null);
exports.MemberController = MemberController = __decorate([
    (0, common_1.Controller)('member'),
    __metadata("design:paramtypes", [member_service_1.MemberService,
        auth_service_1.AuthService])
], MemberController);
//# sourceMappingURL=member.controller.js.map