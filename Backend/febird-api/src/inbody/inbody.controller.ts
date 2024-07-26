import { Controller, Param, Get, Post, Body } from '@nestjs/common';
import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';

@Controller('member/:memberId/inbody')
export class InbodyController {
  constructor(private inbodyService: InbodyService) {}

  @Post()
  create(
    @Param('memberId') memberId: number,
    @Body() createInbodyDto: CreateInbodyDto,
  ) {
    return this.inbodyService.create(+memberId, createInbodyDto);
  }

  @Get()
  findAll(@Param('memberId') memberId: number) {
    return this.inbodyService.findAll(+memberId);
  }
}
