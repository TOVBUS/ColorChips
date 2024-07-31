import { Repository } from 'typeorm';
import { Inbody } from './inbody.entity';
import { Member } from '../member/member.entity';
import { CreateInbodyDto } from './dto/create-inbody.dto';
import { UpdateInbodyDto } from './dto/update-inbody.dto';
export declare class InbodyService {
    private inbodyRepository;
    private memberRepository;
    constructor(inbodyRepository: Repository<Inbody>, memberRepository: Repository<Member>);
    create(member_id: number, createInbodyDto: CreateInbodyDto): Promise<Inbody>;
    findAll(memberId: number): Promise<Inbody[]>;
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<Inbody>;
}
