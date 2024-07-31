import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';
export declare class LevelService {
    private readonly levelRepository;
    private readonly routineRepository;
    constructor(levelRepository: Repository<Level>, routineRepository: Repository<Routine>);
    private getRoutineById;
    findAll(): Promise<Level[]>;
    findOne(id: number): Promise<Level>;
}
