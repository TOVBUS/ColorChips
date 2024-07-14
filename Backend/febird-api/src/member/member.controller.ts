import { Controller, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';

@Controller('members')
export class MemberController {
  constructor(private readonly memberService: MemberService) {}

  // 정보입력
  @Post()
  create(@Body() createMemberDto: CreateMemberDto) {
    return this.memberService.create(createMemberDto);
  }
  // 정보수정
  @Patch(':id')
  update(@Param('id') id: string, @Body() updateMemberDto: UpdateMemberDto) {
    return this.memberService.update(+id, updateMemberDto);
  }
  // 회원정보 삭제
  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.memberService.remove(+id);
  }
}
// 회원가입 - 회원 정보를 받아 회원 가입 처리
// 로그인 - 로그인 정보를 받아 로그인 처리
// 로그아웃 - 로그아웃 처리
// 멤버 조회 - 멤버 일련번호에 맞는 멤버 정보를 조회
// 멤버 수정 - 멤버 일련번호에 맞는 멤버 정보를 수정
// 회원탈퇴 - 멤버 일련번호에 맞는 멤버 정보를 삭제
