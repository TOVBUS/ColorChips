import { Repository } from 'typeorm';
import { Inbody } from './inbody.entity';
import { Member } from '../member/member.entity';
import { CreateInbodyDto } from './dto/create-inbody.dto';
<<<<<<< HEAD
import { UpdateInbodyDto } from './dto/update-inbody.dto';
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
export declare class InbodyService {
    private inbodyRepository;
    private memberRepository;
    constructor(inbodyRepository: Repository<Inbody>, memberRepository: Repository<Member>);
    create(member_id: number, createInbodyDto: CreateInbodyDto): Promise<Inbody>;
    findAll(memberId: number): Promise<Inbody[]>;
<<<<<<< HEAD
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<Inbody>;
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
