import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { History } from './history.entity';
import { Member } from '../member/member.entity';
import { Level } from '../level/level.entity';
import { CreateHistoryDto } from './dto/create-history.dto';

@Injectable()
export class HistoryService {
  constructor(
    @InjectRepository(History)
    private historyRepository: Repository<History>,
    @InjectRepository(Member)
    private memberRepository: Repository<Member>,
    @InjectRepository(Level)
    private levelRepository: Repository<Level>,
  ) {}

  async create(createHistoryDto: CreateHistoryDto): Promise<History> {
    const { member_id, level_id, achievement_date } = createHistoryDto;

    const member = await this.memberRepository.findOne({
      where: { member_id },
    });

    if (!member) {
      throw new NotFoundException(`Member with ID ${member_id} not found`);
    }

    const level = await this.levelRepository.findOne({
      where: { level_id },
    });

    if (!level) {
      throw new NotFoundException(`Level with ID ${level_id} not found`);
    }

    const newHistory = this.historyRepository.create({
      achievement_date,
      member,
      level,
    });

    return await this.historyRepository.save(newHistory);
  }

  async findAll(): Promise<History[]> {
    return await this.historyRepository.find({ relations: ['member', 'level'] });
  }
}
