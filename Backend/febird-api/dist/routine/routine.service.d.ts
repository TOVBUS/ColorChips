import { Repository } from 'typeorm';
import { Routine } from './routine.entity';
import { CreateRoutineDto } from './dto/create-routine.dto';
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    create(createRoutineDto: CreateRoutineDto): Promise<Routine>;
    findAll(): Promise<Routine[]>;
}
