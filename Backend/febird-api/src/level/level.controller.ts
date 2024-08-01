import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';

@Controller('level')
export class LevelController {
  constructor(private readonly levelService: LevelService) {}

  @Get()
  findAll() {
    return this.levelService.findAll();
  }

<<<<<<< HEAD
  @Get(':id')
  async findOne(@Param('id') id: number) {
    try {
      return await this.levelService.findOne(id);
    } catch (error) {
      throw new NotFoundException(`Level with ID ${id} not found`);
    }
  }
}
=======
  //findOne(@Param('id') id: string) {}
  //update(@Param('id') id: string, @Body() updateLevelDto: UpdateLevelDto) {}
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
