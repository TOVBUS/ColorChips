import {
  Controller,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  UseInterceptors,
  UploadedFile,
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';

@Controller('member')
export class MemberController {
  constructor(private memberService: MemberService) {}
  // 회원정보 등록
  @Post()
  @UseInterceptors(FileInterceptor('profile_image'))
  create(@Body() createMemberDto: CreateMemberDto, @UploadedFile() file: any) {
    createMemberDto.profile_image = file.filename;
    return this.memberService.create(createMemberDto);
  }

  // 회원정보 수정
  @Patch(':id')
  @UseInterceptors(FileInterceptor('profile_image'))
  update(
    @Param('id') id: number,
    @Body() updateMemberDto: UpdateMemberDto,
    @UploadedFile() file: any,
  ) {
    if (file) {
      updateMemberDto.profile_image = file.filename; // 파일명을 DTO에 저장
    }
    return this.memberService.update(id, updateMemberDto);
  }

  // 회원정보 삭제
  @Delete(':id')
  remove(@Param('id') id: number) {
    return this.memberService.remove(id);
  }
}
