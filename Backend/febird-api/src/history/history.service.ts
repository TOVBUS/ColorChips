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

    // Member 엔티티 찾기
    const member = await this.memberRepository.findOne({ where: { member_id } });
    if (!member) {
      throw new NotFoundException(`Member with ID ${member_id} not found`);
    }

    // 새 History 엔티티 생성 및 Member 연결
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

    // Update fields
    for (const [key, value] of Object.entries(updateHistoryDto)) {
      history[key] = value;
    }

    return this.historyRepository.save(history);
  }
}
