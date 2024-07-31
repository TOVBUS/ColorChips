import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { RoutineService } from './routine.service';

@Controller('routine')
export class RoutineController {
  constructor(private readonly routineService: RoutineService) {}

  @Get()
  findAll() {
    return this.routineService.findAll();
  }

  @Get(':id')
  async findOne(@Param('id') id: number) {
    const routine = await this.routineService.findOne(id);
    if (!routine) {
      throw new NotFoundException(`ID ${id}에 해당하는 루틴을 찾을 수 없습니다.`);
    }
    return routine;
  }
}