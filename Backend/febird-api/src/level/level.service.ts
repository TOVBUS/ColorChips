import { Injectable, NotFoundException } from '@nestjs/common';
import { InjectRepository } from '@nestjs/typeorm';
import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';
import { CreateLevelDto } from './dto/create-level.dto';

@Injectable()
export class LevelService {
  constructor(
    @InjectRepository(Level)
    private readonly levelRepository: Repository<Level>,
    @InjectRepository(Routine)
    private readonly routineRepository: Repository<Routine>,
  ) {}

  private async getRoutineById(routine_id: number): Promise<Routine> {
    const routine = await this.routineRepository.findOne({ where: { routine_id } });

    if (!routine) {
      throw new NotFoundException(`Routine with ID ${routine_id} not found`);
    }

    return routine;
  }

  async create(createLevelDto: CreateLevelDto): Promise<Level> {
    const routine = await this.getRoutineById(createLevelDto.routine_id);
    
    const level = this.levelRepository.create({
      ...createLevelDto,
      routine: routine,
    });

    return this.levelRepository.save(level);
  }

  async findAll(): Promise<Level[]> {
    return this.levelRepository.find({ relations: ['routine'] });
  }
}
