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

  async findOne(id: number) {
    const exercise = await this.exerciseRepository.findOne({
      where: { exercise_id: id },
    });

    if (!exercise) {
      throw new NotFoundException(`${id}에 해당하는 운동을 찾을 수 없습니다.`);
    }

    return exercise;
  }
}