import { Controller, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';

@Controller('member')
export class MemberController {
  constructor(private readonly memberService: MemberService) {}
  // 회원정보 등록
  @Post()
  create(@Body() createMemberDto: CreateMemberDto) {
    return this.memberService.create(createMemberDto);
  }

  // 회원정보 수정
  @Patch(':id')
  update(@Param('id') id: number, @Body() updateMemberDto: UpdateMemberDto) {
    return this.memberService.update(id, updateMemberDto);
  }

  // 회원정보 삭제
  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.memberService.remove(id);
  }
}
