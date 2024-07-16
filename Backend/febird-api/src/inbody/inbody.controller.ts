import { Controller, Get, Post, Body, Patch, Param, Delete } from '@nestjs/common';
import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';
import { UpdateInbodyDto } from './dto/update-inbody.dto';

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

  @Get(':id')
  findOne(@Param('id') id: string) {
    return this.inbodyService.findOne(+id);
  }

  @Patch(':id')
  update(@Param('id') id: string, @Body() updateInbodyDto: UpdateInbodyDto) {
    return this.inbodyService.update(+id, updateInbodyDto);
  }

  @Delete(':id')
  remove(@Param('id') id: string) {
    return this.inbodyService.remove(+id);
  }
}
