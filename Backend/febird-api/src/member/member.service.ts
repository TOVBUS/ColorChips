import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Member } from './entity/member.entity';
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

  // async findByAppleId(appleId: string): Promise<Member> {
  //   return await this.memberRepository.findOne({ where: { appleId } });
  // }

  async update(id: number, updateMemberDto: UpdateMemberDto): Promise<Member> {
    await this.memberRepository.update(id, updateMemberDto);
    return this.memberRepository.findOne({ where: { id } });
  }

  async remove(id: number): Promise<void> {
    await this.memberRepository.delete(id);
  }
}

// 회원가입 - 회원 정보를 받아 회원 가입 처리
// 로그인 - 로그인 정보를 받아 로그인 처리
// 로그아웃 - 로그아웃 처리
// 멤버 조회 - 멤버 일련번호에 맞는 멤버 정보를 조회
// 멤버 수정 - 멤버 일련번호에 맞는 멤버 정보를 수정
// 회원탈퇴 - 멤버 일련번호에 맞는 멤버 정보를 삭제

// import { Injectable, NoFoundException } from '@nestjs/common';
// import { InjectRepository } from '@nestjs/typeorm';
// import { Repository } from 'typeorm';
// import { Member } from './entities/member.entity';
// // import { getConnection } from 'typeorm';
// import * as bycrypt from '@types/bcrypt';
// import { CreateMemberDto } from './dto/create-member.dto';
// import { UpdateMemberDto } from './dto/update-member.dto';

// export class MemberService {
//   constructor(
//     @InjectRepository(Member)
//     private memberRepository: Repository<Member>, //Member 엔터티를 Repository로 사용
//   ) {}

//   //회원가입
//   // async signUp(member: Member): Promise<Member> {
//   //   const memberData = this.memberRepository.create(member);
//   //   return await this.memberRepository.save(memberData);
//   // }
//   async create(memberData: Partial<Member>): Promise<Member> {
//     const hashedPassword = await bcrypt.hash(memberData.password, 10);
//     const newMember = this.memberRepository.create({ ...memberData, password: hashedPassword });
//     return this.memberRepository.save(newMember);
//   }
//   // 로그인
//   signIn(member: Member): Promise<Member> {
//     return this.memberRepository.signIn(member);
//   }

//   // 로그아웃
//   logout(member: Member): Promise<Member> {
//     return this.memberRepository.logout(member);
//   }
//   // 회원탈퇴
//   async quit(id: number): Promise<void> {
//     await this.memberRepository.delete(id);
//   }
//   // 멤버 조회
//   async findOne(id: number): Promise<Member> {
//     return await this.memberRepository.findOne({ where: { id } });
//   }

//   // 멤버 수정
//   async update(id: number, updateMemberDto: UpdateMemberDto): Promise<Member> {
//     await this.memberRepository.update(id, updateMemberDto);
//     return this.findOne(id);
// Apple 로그인으로 회원 정보 생성 및 저장
//   }
