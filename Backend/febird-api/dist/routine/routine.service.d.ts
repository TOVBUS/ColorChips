import { Repository } from 'typeorm';
import { Routine } from './routine.entity';
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    findAll(): Promise<Routine[]>;
    findOne(id: number): Promise<Routine | null>;
}
