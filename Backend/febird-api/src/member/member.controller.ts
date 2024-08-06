import {
  Controller, Post, Body, Patch, Param, Delete, Get, UseInterceptors, UploadedFile, Res, HttpStatus
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { Response } from 'express';
import * as jwt from 'jsonwebtoken';

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

  @Post('apple-login')
  async appleLogin(@Body('appleID') appleID: string, @Res() res: Response) {
    try {
      // 애플 ID로 회원을 조회
      let member = await this.memberService.findByAppleId(appleID);
      
      // 회원이 없으면 신규 회원 등록
      if (!member) {
        member = await this.memberService.create({ appleID } as CreateMemberDto);
      }
  

    // JWT 토큰 생성
      const token = jwt.sign({ member_id: member.member_id }, 'your-secret-key', { expiresIn: '1h' });
      return res.status(HttpStatus.OK).json({ token });
    } catch (error) {
      console.error(error); // 상세한 오류 로그 출력
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '애플 로그인 실패', error: error.message });
    }
  }
}