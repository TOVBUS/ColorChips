import { Injectable, NotFoundException } from '@nestjs/common';
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
    return this.memberRepository.save(member);
  }

  async findOne(member_id: number): Promise<Member> {
    const member = await this.memberRepository.findOne({ where: { member_id } });
    if (!member) {
      throw new NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
    }
    return member;
  }

  async findByAppleId(appleID: string): Promise<Member | null> {
    const member = await this.memberRepository.findOne({ where: { appleID } });
    if (!member) {
      throw new NotFoundException(` ${appleID} 애플아이디를 가진 회원을 찾을 수 없습니다.`);
    }
    return member;
  }

  async update(
    member_id: number,
    updateMemberDto: UpdateMemberDto,
  ): Promise<Member> {
    await this.memberRepository.update(member_id, updateMemberDto);
    const updatedMember = await this.memberRepository.findOne({ where: { member_id } });
    if (!updatedMember) {
      throw new NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
    }
    return updatedMember;
  }

  async remove(member_id: number): Promise<void> {
    const result = await this.memberRepository.delete(member_id);
    if (result.affected === 0) {
      throw new NotFoundException(`MemberID ${member_id}의 회원을 찾을 수 없습니다.`);
    }
  }
}