import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
<<<<<<< HEAD
<<<<<<< HEAD
import { Response } from 'express';
export declare class MemberController {
    private memberService;
    constructor(memberService: MemberService);
    create(createMemberDto: CreateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    update(id: number, updateMemberDto: UpdateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    findOne(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    remove(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
=======
export declare class MemberController {
    private memberService;
    constructor(memberService: MemberService);
    create(createMemberDto: CreateMemberDto, file: any): Promise<import("./member.entity").Member>;
    update(id: number, updateMemberDto: UpdateMemberDto, file: any): Promise<import("./member.entity").Member>;
    remove(id: number): Promise<void>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
import { Response } from 'express';
export declare class MemberController {
    private memberService;
    constructor(memberService: MemberService);
    create(createMemberDto: CreateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    update(id: number, updateMemberDto: UpdateMemberDto, file: any, res: Response): Promise<Response<any, Record<string, any>>>;
    findOne(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
    remove(id: number, res: Response): Promise<Response<any, Record<string, any>>>;
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
}
