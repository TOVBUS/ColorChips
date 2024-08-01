import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { RoutineService } from './routine.service';

@Controller('routine')
export class RoutineController {
  constructor(private readonly routineService: RoutineService) {}

  @Get()
  findAll() {
    return this.routineService.findAll();
  }
<<<<<<< HEAD

  @Get(':id')
  async findOne(@Param('id') id: number) {
    const routine = await this.routineService.findOne(id);
    if (!routine) {
      throw new NotFoundException(`ID ${id}에 해당하는 루틴을 찾을 수 없습니다.`);
    }
    return routine;
  }
}
=======
  
  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.routineService.findOne(+id);
  // }
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
