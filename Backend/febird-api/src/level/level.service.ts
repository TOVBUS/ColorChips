import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';

@Injectable()
export class LevelService {
  constructor(
    @InjectRepository(Level)
    private readonly levelRepository: Repository<Level>,
    @InjectRepository(Routine)
    private readonly routineRepository: Repository<Routine>,
  ) {}

  private async getRoutineById(routine_id: number): Promise<Routine> {
    const routine = await this.routineRepository.findOne({
      where: { routine_id },
    });

    if (!routine) {
      throw new NotFoundException(`Routine with ID ${routine_id} not found`);
    }
    return routine;
  }

  async findAll(): Promise<Level[]> {
    return this.levelRepository.find({ relations: ['routines'] });
  }

  async findOne(id: number): Promise<Level> {
    const level = await this.levelRepository.findOne({
      where: { level_id: id },
      relations: ['routines'],
    });
    
    if (!level) {
      throw new NotFoundException(`Level with ID ${id} not found`);
    }
<<<<<<< HEAD
<<<<<<< HEAD
=======

>>>>>>> 82dded9 (✨ :: level의 FindOne, FindAll 로직만 남기기 #KAN-257)
=======
>>>>>>> 9b09117 (🗑️ :: Member & Level 필요없는 코드, 주석, 띄어쓰기 삭제 #KAN-257)
    return level;
  }
}