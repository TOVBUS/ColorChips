import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
export declare class MemberController {
    private memberService;
    constructor(memberService: MemberService);
    create(createMemberDto: CreateMemberDto, file: any): Promise<import("./member.entity").Member>;
    update(id: number, updateMemberDto: UpdateMemberDto, file: any): Promise<import("./member.entity").Member>;
    remove(id: number): Promise<void>;
}
