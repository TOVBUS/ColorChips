import { Repository } from 'typeorm';
import { Level } from './level.entity';
import { Routine } from '../routine/routine.entity';
<<<<<<< HEAD
<<<<<<< HEAD
=======
import { CreateLevelDto } from './dto/create-level.dto';
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> 221e99d (✨ :: level의 FindOne 로직 예외처리 #KAN-257)
export declare class LevelService {
    private readonly levelRepository;
    private readonly routineRepository;
    constructor(levelRepository: Repository<Level>, routineRepository: Repository<Routine>);
    private getRoutineById;
<<<<<<< HEAD
<<<<<<< HEAD
    findAll(): Promise<Level[]>;
    findOne(id: number): Promise<Level>;
=======
    create(createLevelDto: CreateLevelDto): Promise<Level>;
    findAll(): Promise<Level[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    findAll(): Promise<Level[]>;
    findOne(id: number): Promise<Level>;
>>>>>>> 221e99d (✨ :: level의 FindOne 로직 예외처리 #KAN-257)
}
