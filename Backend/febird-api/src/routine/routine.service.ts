import { Injectable } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Routine } from './routine.entity';

@Injectable()
export class RoutineService {
  constructor(
    @InjectRepository(Routine)
    private routineRepository: Repository<Routine>,
  ) {}

  findAll() {
    return this.routineRepository.find();
  }

  // findOne(id: number) {
  //   return this.routineRepository.findOne(id);
  // }
}
