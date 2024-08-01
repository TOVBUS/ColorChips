import { Repository } from 'typeorm';
import { Routine } from './routine.entity';
<<<<<<< HEAD
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    findAll(): Promise<Routine[]>;
    findOne(id: number): Promise<Routine | null>;
=======
import { CreateRoutineDto } from './dto/create-routine.dto';
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    create(createRoutineDto: CreateRoutineDto): Promise<Routine>;
    findAll(): Promise<Routine[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
