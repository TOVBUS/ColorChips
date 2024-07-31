import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';

@Injectable()
export class ExerciseService {
  constructor(
    @InjectRepository(Exercise)
    private exerciseRepository: Repository<Exercise>,
  ) {}

  async findAll() {
    return this.exerciseRepository.find();
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
  async findOne(id: number) {
    const exercise = await this.exerciseRepository.findOne({
      where: { exercise_id: id },
    });

    if (!exercise) {
      throw new NotFoundException(`Exercise with ID ${id} not found`);
    }

    return exercise;
  }
<<<<<<< HEAD
}
=======
  //findOne(id: number) {}
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
=======
}
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
