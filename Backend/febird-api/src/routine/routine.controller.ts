import { Controller, Get } from '@nestjs/common';
import { RoutineService } from './routine.service';

@Controller('routine')
export class RoutineController {
  constructor(private readonly routineService: RoutineService) {}

  @Get()
  findAll() {
    return this.routineService.findAll();
  }
  
  // @Get(':id')
  // findOne(@Param('id') id: string) {
  //   return this.routineService.findOne(+id);
  // }
}
