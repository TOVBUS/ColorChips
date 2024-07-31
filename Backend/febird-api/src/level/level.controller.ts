import { Controller, Get, Post, Body, Patch, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';
import { CreateLevelDto } from './dto/create-level.dto';
import { UpdateLevelDto } from './dto/update-level.dto'; // UpdateLevelDto를 추가

@Controller('level')
export class LevelController {
  constructor(private readonly levelService: LevelService) {}

  @Get()
  findAll() {
    return this.levelService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    try {
      return await this.levelService.findOne(id);
    } catch (error) {
      throw new NotFoundException(`Level with ID ${id} not found`);
    }
  }
}
