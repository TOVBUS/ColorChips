import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';
import { CreateLevelDto } from './dto/create-level.dto';
export declare class LevelService {
    private readonly levelRepository;
    private readonly routineRepository;
    constructor(levelRepository: Repository<Level>, routineRepository: Repository<Routine>);
    private getRoutineById;
    create(createLevelDto: CreateLevelDto): Promise<Level>;
    findAll(): Promise<Level[]>;
}
