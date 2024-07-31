import { Repository } from 'typeorm';
import { Inbody } from './inbody.entity';
import { Member } from '../member/member.entity';
import { CreateInbodyDto } from './dto/create-inbody.dto';
<<<<<<< HEAD
<<<<<<< HEAD
import { UpdateInbodyDto } from './dto/update-inbody.dto';
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
import { UpdateInbodyDto } from './dto/update-inbody.dto';
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
export declare class InbodyService {
    private inbodyRepository;
    private memberRepository;
    constructor(inbodyRepository: Repository<Inbody>, memberRepository: Repository<Member>);
    create(member_id: number, createInbodyDto: CreateInbodyDto): Promise<Inbody>;
    findAll(memberId: number): Promise<Inbody[]>;
<<<<<<< HEAD
<<<<<<< HEAD
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<Inbody>;
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<Inbody>;
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
}
