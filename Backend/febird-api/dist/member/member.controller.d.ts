import { MemberService } from './member.service';
import { UpdateMemberDto } from './dto/update-member.dto';
import { Response } from 'express';
import { AuthService } from '../auth/auth.service';
export declare class MemberController {
    private readonly memberService;
    private readonly authService;
    constructor(memberService: MemberService, authService: AuthService);
    update(id: number, updateMemberDto: UpdateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    findOne(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    remove(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    appleLogin(appleID: string, res: Response): Promise<Response<any, Record<string, any>>>;
    getProtected(req: any): {
        member_id: any;
    };
}
