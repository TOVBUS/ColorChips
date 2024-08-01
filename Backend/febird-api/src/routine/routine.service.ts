import { Injectable, NotFoundException } from '@nestjs/common';
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

<<<<<<< HEAD
  async findOne(id: number): Promise<Routine | null> {
    const routine = await this.routineRepository.findOne({
      where: { routine_id: id },
      relations: ['level', 'exercise'],
    });
    return routine || null;
  }
}
=======
  // findOne(id: number) {
  //   return this.routineRepository.findOne(id);
  // }
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
