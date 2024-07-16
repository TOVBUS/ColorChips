import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';

@Controller('inbody')
export class InbodyController {
  constructor(private readonly inbodyService: InbodyService) {}

  // 인바디 생성
  @Post()
  create(@Body() createInbodyDto: CreateInbodyDto) {
    return this.inbodyService.create(createInbodyDto);
  }

  // 모든 인바디 조회
  @Get()
  findAll() {
    return this.inbodyService.findAll();
  }
}