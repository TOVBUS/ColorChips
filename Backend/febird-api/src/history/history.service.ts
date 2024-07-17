import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { History } from './history.entity';
import { CreateHistoryDto } from './dto/create-history.dto';
import { UpdateHistoryDto } from './dto/update-history.dto';
import { Member } from '../member/member.entity';

@Injectable()
export class HistoryService {
  constructor(
    @InjectRepository(History)
    private historyRepository: Repository<History>,
    @InjectRepository(Member)
    private memberRepository: Repository<Member>,
  ) {}

  async create(createHistoryDto: CreateHistoryDto): Promise<History> {
    const { member_id, ...historyData } = createHistoryDto;

    const member = await this.memberRepository.findOne({ where: { member_id } });
    if (!member) {
      throw new NotFoundException(`Member with ID ${member_id} not found`);
    }

    const newHistory = this.historyRepository.create({
      ...historyData,
      member: member,
    });

    return await this.historyRepository.save(newHistory);
  }

  async update(id: number, updateHistoryDto: UpdateHistoryDto): Promise<History> {
    const history = await this.historyRepository.findOne({ where: { history_id: id } });
    if (!history) {
      throw new NotFoundException(`History with ID ${id} not found`);
    }
    
    for (const [key, value] of Object.entries(updateHistoryDto)) {
      history[key] = value;
    }

    return this.historyRepository.save(history);
  }
}
