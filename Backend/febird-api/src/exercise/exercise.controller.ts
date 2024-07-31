import { Controller, Get, Param } from '@nestjs/common';
import { ExerciseService } from './exercise.service';

@Controller('exercise')
export class ExerciseController {
  constructor(private readonly exerciseService: ExerciseService) {}

  @Get()
  findAll() {
    return this.exerciseService.findAll();
  }
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)

  @Get(':id')
  findOne(@Param('id') id: number) {
    return this.exerciseService.findOne(id);
  }
<<<<<<< HEAD
}
=======
  //findOne(@Param('id') id: string) {}
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
=======
}
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
