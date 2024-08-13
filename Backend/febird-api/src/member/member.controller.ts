import {
  Controller, Post, Body, Patch, Param, Delete, Get, UseGuards, UseInterceptors, UploadedFile, Res, HttpStatus, Request,
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { AuthGuard } from '@nestjs/passport';
import { Response } from 'express';
import { AuthService } from '../auth/auth.service';

@Controller('member')
export class MemberController {
  constructor(
    private readonly memberService: MemberService,
    private readonly authService: AuthService,
  ) {}

  @Patch(':id')
  @UseInterceptors(FileInterceptor('profile_image'))
  async update(
    @Param('id') id: number,
    @Body() updateMemberDto: UpdateMemberDto,
    @UploadedFile() file: any,
    @Res() res: Response,
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
      let member = await this.memberService.findByAppleId(appleID);
      if (!member) {
        member = await this.memberService.create({ appleID } as CreateMemberDto);
      }
      const token = await this.authService.generateToken(member.member_id); 
      return res.status(HttpStatus.OK).json({ token });
    } catch (error) {
      console.error(error);
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '애플 로그인 실패', error: error.message });
    }
  }

  @Get('apple/:appleID')
  async findByAppleID(@Param('appleID') appleID: string, @Res() res: Response) {
    try {
      console.log('Received appleID:', appleID);
      const member = await this.memberService.findByAppleId(appleID);
      console.log('Found member:', member);
      if (!member) {
        return res.status(HttpStatus.NOT_FOUND).json({ message: '회원을 찾을 수 없습니다.' });
      }
      return res.status(HttpStatus.OK).json({ member_id: member.member_id });
    } catch (error) {
      console.error('Error occurred:', error);
      return res.status(HttpStatus.INTERNAL_SERVER_ERROR).json({ message: '서버 오류', error: error.message });
    }
  }

  @Get('protected')
  @UseGuards(AuthGuard('jwt'))
  getProtected(@Request() req) {
    return { member_id: req.user.member_id };
  }
}



  // @Post()
  // @UseInterceptors(FileInterceptor('profile_image'))
  // async create(@Body() createMemberDto: CreateMemberDto, @UploadedFile() file: any, @Res() res: Response) {
  //   try {
  //     createMemberDto.profile_image = file.filename;
  //     const member = await this.memberService.create(createMemberDto);
  //     return res.status(HttpStatus.CREATED).json(member);
  //   } catch (error) {
  //     return res.status(HttpStatus.BAD_REQUEST).json({ message: '회원 정보 등록 실패' });
  //   }
  // }