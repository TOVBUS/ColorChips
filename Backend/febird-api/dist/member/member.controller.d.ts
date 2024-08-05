import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { Response } from 'express';
export declare class MemberController {
    private memberService;
    constructor(memberService: MemberService);
    create(createMemberDto: CreateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    update(id: number, updateMemberDto: UpdateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    findOne(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    remove(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    appleLogin(appleID: string, res: Response): Promise<Response<any, Record<string, any>>>;
}
