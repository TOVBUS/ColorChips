import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Member } from './member.entity';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';

@Injectable()
export class MemberService {
  constructor(
    @InjectRepository(Member)
    private memberRepository: Repository<Member>,
  ) {}

  async create(createMemberDto: CreateMemberDto): Promise<Member> {
    const member = this.memberRepository.create(createMemberDto);
    return await this.memberRepository.save(member);
  }

  // Apple Sign에 필요한 것
  // async findByAppleId(appleId: string): Promise<Member> {
  //   return await this.memberRepository.findOne({ where: { appleId } });
  // }

  async update(member_id: number, updateMemberDto: UpdateMemberDto): Promise<Member> {
    await this.memberRepository.update(member_id, updateMemberDto);
    return await this.memberRepository.findOne({ where: { member_id } });
  }

  async remove(member_id: number): Promise<void> {
    await this.memberRepository.delete(member_id);
  }
}
