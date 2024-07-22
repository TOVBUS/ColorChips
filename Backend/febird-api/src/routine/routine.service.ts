import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Routine } from './routine.entity';
import { CreateRoutineDto } from './dto/create-routine.dto';

@Injectable()
export class RoutineService {
  constructor(
    @InjectRepository(Routine)
    private routineRepository: Repository<Routine>,
  ) {}

  create(createRoutineDto: CreateRoutineDto) {
    const routine = this.routineRepository.create(createRoutineDto);
    return this.routineRepository.save(routine);
  }

  findAll() {
    return this.routineRepository.find();
  }
}
