import { Repository } from 'typeorm';
import { Member } from './member.entity';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
export declare class MemberService {
    private memberRepository;
    constructor(memberRepository: Repository<Member>);
    create(createMemberDto: CreateMemberDto): Promise<Member>;
    findOne(member_id: number): Promise<Member>;
    update(member_id: number, updateMemberDto: UpdateMemberDto): Promise<Member>;
    remove(member_id: number): Promise<void>;
}
