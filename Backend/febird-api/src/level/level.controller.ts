import { Controller, Get, Post, Body, Patch, Param } from '@nestjs/common';
import { LevelService } from './level.service';
import { CreateLevelDto } from './dto/create-level.dto';

@Controller('level')
export class LevelController {
  constructor(private readonly levelService: LevelService) {}
  @Post()
  create(@Body() createLevelDto: CreateLevelDto) {
    return this.levelService.create(createLevelDto);
  }

  @Get()
  findAll() {
    return this.levelService.findAll();
  }

  //findOne(@Param('id') id: string) {}
  //update(@Param('id') id: string, @Body() updateLevelDto: UpdateLevelDto) {}
}
