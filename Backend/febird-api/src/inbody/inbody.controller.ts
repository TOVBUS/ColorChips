import { Controller, Get, Post, Body } from '@nestjs/common';
import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';

@Controller('inbody')
export class InbodyController {
  constructor(private readonly inbodyService: InbodyService) {}

  @Post()
  create(@Body() createInbodyDto: CreateInbodyDto) {
    return this.inbodyService.create(createInbodyDto);
  }

  @Get()
  findAll() {
    return this.inbodyService.findAll();
  }
}