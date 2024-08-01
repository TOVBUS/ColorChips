import { Controller, Get, Post, Body, Param } from '@nestjs/common';
import { HistoryService } from './history.service';
import { CreateHistoryDto } from './dto/create-history.dto';

@Controller('member/:memberId/history')
export class HistoryController {
  constructor(private readonly historyService: HistoryService) {}

  @Post()
  create(
    @Param('memberId') memberId: number,
    @Body() createHistoryDto: CreateHistoryDto,
  ) {
    return this.historyService.create(+memberId, createHistoryDto);
  }

  @Get()
  findAll(@Param('memberId') memberId: number) {
    return this.historyService.findAll(+memberId);
  }
}