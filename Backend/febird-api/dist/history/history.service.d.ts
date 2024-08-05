import { Repository } from 'typeorm';
import { History } from './history.entity';
import { Member } from '../member/member.entity';
import { Level } from '../level/level.entity';
import { CreateHistoryDto } from './dto/create-history.dto';
export declare class HistoryService {
    private historyRepository;
    private memberRepository;
    private levelRepository;
    constructor(historyRepository: Repository<History>, memberRepository: Repository<Member>, levelRepository: Repository<Level>);
    create(member_id: number, createHistoryDto: CreateHistoryDto): Promise<History>;
    findAll(memberId: number): Promise<History[]>;
}
