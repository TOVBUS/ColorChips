import {
  Controller, Post, Body, Patch, Param, Delete, Get, UseInterceptors, UploadedFile, Res, HttpStatus
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { Response } from 'express';

@Controller('member')
export class MemberController {
  constructor(private memberService: MemberService) {}

  @Post()
  @UseInterceptors(FileInterceptor('profile_image'))
  async create(@Body() createMemberDto: CreateMemberDto, @UploadedFile() file: any, @Res() res: Response) {
    try {
      createMemberDto.profile_image = file.filename;
      const member = await this.memberService.create(createMemberDto);
      return res.status(HttpStatus.CREATED).json(member);
    } catch (error) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '회원 정보 등록 실패' });
    }
  }

  @Patch(':id')
  @UseInterceptors(FileInterceptor('profile_image'))
  async update(
    @Param('id') id: number,
    @Body() updateMemberDto: UpdateMemberDto,
    @UploadedFile() file: any,
    @Res() res: Response
  ) {
    try {
      if (file) {
        updateMemberDto.profile_image = file.filename;
      }
      const updatedMember = await this.memberService.update(id, updateMemberDto);
      return res.status(HttpStatus.OK).json(updatedMember);
    } catch (error) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '회원 정보 수정 실패' });
    }
  }

  @Get(':id')
  async findOne(@Param('id') id: number, @Res() res: Response) {
    try {
      const member = await this.memberService.findOne(id);
      return res.status(HttpStatus.OK).json(member);
    } catch (error) {
      return res.status(HttpStatus.NOT_FOUND).json({ message: '회원을 조회 할 수 없습니다.' });
    }
  }

  @Delete(':id')
  async remove(@Param('id') id: number, @Res() res: Response) {
    try {
      await this.memberService.remove(id);
      return res.status(HttpStatus.OK).json({ message: 'Member 삭제 성공!' });
    } catch (error) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '회원 정보 삭제 실패' });
    }
  }
}