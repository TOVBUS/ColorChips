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

  async create(createInbodyDto: CreateInbodyDto): Promise<Inbody> {
    const { uuid, ...inbodyData } = createInbodyDto;

    // Member 엔티티 찾기
    const member = await this.memberRepository.findOne({ where: { uuid } });
    if (!member) {
      throw new NotFoundException(`Member with UUID ${uuid} not found`);
    }

    // 새 Inbody 엔티티 생성 및 Member 연결
    const newInbody = this.inbodyRepository.create({
      ...inbodyData,
      member: member,
    });

    // 저장 및 반환
    return await this.inbodyRepository.save(newInbody);
  }

  async findAll(): Promise<Inbody[]> {
    return await this.inbodyRepository.find({ relations: ['member'] });
  }
}