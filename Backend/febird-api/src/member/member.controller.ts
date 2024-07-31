import {
  Controller,
  Post,
  Body,
  Get,
  Patch,
  Param,
  Delete,
  UseInterceptors,
  UploadedFile,
  Res,
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { Response } from 'express';

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
      updateMemberDto.profile_image = file.filename;
    }
    return this.memberService.update(id, updateMemberDto);
  }

 // 특정 회원정보 조회
  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.memberService.findOne(id);
  } 

  // 회원정보 삭제
  @Delete(':id')
  async remove(@Param('id') id: number, @Res() res: Response) {
    await this.memberService.remove(id);
    return res.status(200).json({ message: 'Member 삭제 성공!' });
  }
}