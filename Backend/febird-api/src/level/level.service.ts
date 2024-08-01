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
      throw new NotFoundException(`${routine_id}에 해당하는 루틴을 찾을 수 없습니다.`);
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
      throw new NotFoundException(`${id}에 해당하는 레벨을 찾을 수 없습니다.`);
    }
    return level;
  }
}