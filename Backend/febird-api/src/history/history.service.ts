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

  async create(
    member_id: number,
    createHistoryDto: CreateHistoryDto,
  ): Promise<History> {
    const member = await this.memberRepository.findOne({
      where: { member_id: member_id },
    });

    if (!member) {
      throw new NotFoundException(`${member_id}에 해당하는 회원이 없습니다.`);
    }

    const level = await this.levelRepository.findOne({
      where: { level_id: createHistoryDto.level_id },
    });

    if (!level) {
      throw new NotFoundException(
        `${createHistoryDto.level_id}에 해당하는 레벨을 찾을 수 없습니다.`,
      );
    }

    const newHistory = this.historyRepository.create({
      ...createHistoryDto,
      member: member,
      level: level,
    });

    return await this.historyRepository.save(newHistory);
  }

  async findAll(memberId: number): Promise<History[]> {
    const member = await this.memberRepository.findOne({
      where: { member_id: memberId },
      relations: ['histories'],
    });

    if (!member) {
      throw new NotFoundException(`${memberId}에 해당하는 회원이 없습니다.`);
    }

    return member.histories;
  }
}