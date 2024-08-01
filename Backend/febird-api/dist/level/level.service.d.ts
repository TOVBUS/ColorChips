import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';
<<<<<<< HEAD
=======
import { CreateLevelDto } from './dto/create-level.dto';
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
export declare class LevelService {
    private readonly levelRepository;
    private readonly routineRepository;
    constructor(levelRepository: Repository<Level>, routineRepository: Repository<Routine>);
    private getRoutineById;
<<<<<<< HEAD
    findAll(): Promise<Level[]>;
    findOne(id: number): Promise<Level>;
=======
    create(createLevelDto: CreateLevelDto): Promise<Level>;
    findAll(): Promise<Level[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
