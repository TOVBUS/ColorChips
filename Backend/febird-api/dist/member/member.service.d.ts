import { Repository } from 'typeorm';
import { Member } from './member.entity';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
export declare class MemberService {
    private memberRepository;
    constructor(memberRepository: Repository<Member>);
    create(createMemberDto: CreateMemberDto): Promise<Member>;
<<<<<<< HEAD
<<<<<<< HEAD
    findOne(member_id: number): Promise<Member>;
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    findOne(member_id: number): Promise<Member>;
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
    update(member_id: number, updateMemberDto: UpdateMemberDto): Promise<Member>;
    remove(member_id: number): Promise<void>;
}
