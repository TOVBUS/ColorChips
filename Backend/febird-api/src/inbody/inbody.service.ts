import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Inbody } from './inbody.entity';
import { Member } from '../member/member.entity';
import { CreateInbodyDto } from './dto/create-inbody.dto';
import { UpdateInbodyDto } from './dto/update-inbody.dto';

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
      where: { member_id: member_id },
    });

    if (!member) {
      throw new NotFoundException(`${member_id}에 해당하는 회원을 찾을 수 없습니다.`);
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
      throw new NotFoundException(`${memberId}에 해당하는 회원을 찾을 수 없습니다.`);
    }

    return member.inbodies;
  }

  async update(
    memberId: number,
    inbodyId: number,
    updateInbodyDto: UpdateInbodyDto,
  ): Promise<Inbody> {
    const inbody = await this.inbodyRepository.findOne({
      where: { inbody_id: inbodyId, member: { member_id: memberId } },
      relations: ['member'],
    });

    if (!inbody) {
      throw new NotFoundException(`${inbodyId}에 해당하는 인바디를 찾을 수 없습니다.`);
    }

    Object.assign(inbody, updateInbodyDto);

    return await this.inbodyRepository.save(inbody);
  }
}