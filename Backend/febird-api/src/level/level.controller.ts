import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';

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
