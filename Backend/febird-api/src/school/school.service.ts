import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { School } from './school.entity';
import { Member } from '../member/member.entity';
import { CreateSchoolDto } from './dto/create-school.dto';

@Injectable()
export class SchoolService {
  constructor(
    @InjectRepository(School)
    private schoolRepository: Repository<School>,
    @InjectRepository(Member)
    private memberRepository: Repository<Member>,
  ) {}

  async create(createSchoolDto: CreateSchoolDto): Promise<School> {
    const { uuid, ...schoolData } = createSchoolDto;

    // Member 엔티티 찾기
    const member = await this.memberRepository.findOne({ where: { uuid } });
    if (!member) {
      throw new NotFoundException(`Member with UUID ${uuid} not found`);
    }

    // 새 School 엔티티 생성 및 Member 연결
    const newSchool = this.schoolRepository.create({
      ...schoolData,
      member: member,
    });

    // 저장 및 반환
    return await this.schoolRepository.save(newSchool);
  }
}
