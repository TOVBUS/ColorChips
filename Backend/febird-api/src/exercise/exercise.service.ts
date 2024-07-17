import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';
import { CreateExerciseDto } from './dto/create-exercise.dto';
import { UpdateExerciseDto } from './dto/update-exercise.dto';

@Injectable()
export class ExerciseService {
  constructor(
    @InjectRepository(Exercise)
    private exerciseRepository: Repository<Exercise>,
  ) {}

  create(createExerciseDto: CreateExerciseDto) {
    const exercise = this.exerciseRepository.create(createExerciseDto);
    return this.exerciseRepository.save(exercise);
  }

  findAll() {
    return this.exerciseRepository.find();
  }

  update(id: number, updateExerciseDto: UpdateExerciseDto) {
    return this.exerciseRepository.update(id, updateExerciseDto);
  }

  remove(id: number) {
    return this.exerciseRepository.delete(id);
  }
}