import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Inbody } from './inbody.entity';
import { Member } from '../member/member.entity';
import { CreateInbodyDto } from './dto/create-inbody.dto';

@Injectable()
export class InbodyService {
  constructor(
    @InjectRepository(Inbody)
    private inbodyRepository: Repository<Inbody>,
    @InjectRepository(Member)
    private memberRepository: Repository<Member>,
  ) {}

  async create(
    member_id: number,
    createInbodyDto: CreateInbodyDto,
  ): Promise<Inbody> {
    const member = await this.memberRepository.findOne({
      where: { member_id: createInbodyDto.member_id },
    });

    if (!member) {
      throw new NotFoundException(`Member with ID ${member_id} not found`);
    }

    const newInbody = this.inbodyRepository.create({
      ...createInbodyDto,
      member: member,
    });

    return await this.inbodyRepository.save(newInbody);
  }

  async findAll(memberId: number): Promise<Inbody[]> {
    const member = await this.memberRepository.findOne({
      where: { member_id: memberId },
      relations: ['inbodies'],
    });

    if (!member) {
      throw new NotFoundException(`Member with ID ${memberId} not found`);
    }

    return member.inbodies;
  }
}
