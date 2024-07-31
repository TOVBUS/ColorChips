import {
<<<<<<< HEAD
<<<<<<< HEAD
  Controller, Post, Body, Patch, Param, Delete, Get, UseInterceptors, UploadedFile, Res, HttpStatus
=======
  Controller,
  Post,
  Body,
  Patch,
  Param,
  Delete,
  Get,
  UseInterceptors,
  UploadedFile,
  Res,
<<<<<<< HEAD
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
=======
  HttpStatus,
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
=======
  Controller, Post, Body, Patch, Param, Delete, Get, UseInterceptors, UploadedFile, Res, HttpStatus
>>>>>>> 9b09117 (🗑️ :: Member & Level 필요없는 코드, 주석, 띄어쓰기 삭제 #KAN-257)
} from '@nestjs/common';
import { MemberService } from './member.service';
import { CreateMemberDto } from './dto/create-member.dto';
import { UpdateMemberDto } from './dto/update-member.dto';
import { FileInterceptor } from '@nestjs/platform-express';
import { Response } from 'express';

@Controller('member')
export class MemberController {
  constructor(private memberService: MemberService) {}

<<<<<<< HEAD
<<<<<<< HEAD
=======
  // 회원정보 등록
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
=======
>>>>>>> 9b09117 (🗑️ :: Member & Level 필요없는 코드, 주석, 띄어쓰기 삭제 #KAN-257)
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
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
    try {
      if (file) {
        updateMemberDto.profile_image = file.filename;
      }
      const updatedMember = await this.memberService.update(id, updateMemberDto);
      return res.status(HttpStatus.OK).json(updatedMember);
    } catch (error) {
      return res.status(HttpStatus.BAD_REQUEST).json({ message: '회원 정보 수정 실패' });
<<<<<<< HEAD
=======
    if (file) {
      updateMemberDto.profile_image = file.filename;
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
    }
  }

<<<<<<< HEAD
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
=======
 // 특정 회원정보 조회
=======
    }
  }

<<<<<<< HEAD
  // 특정 회원정보 조회
>>>>>>> ddb64d9 (✨ :: Member의 예외처리 추가 #KAN-257)
=======
>>>>>>> 9b09117 (🗑️ :: Member & Level 필요없는 코드, 주석, 띄어쓰기 삭제 #KAN-257)
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
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
}