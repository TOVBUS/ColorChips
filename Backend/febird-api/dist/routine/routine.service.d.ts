import { Repository } from 'typeorm';
import { Routine } from './routine.entity';
<<<<<<< HEAD
<<<<<<< HEAD
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    findAll(): Promise<Routine[]>;
    findOne(id: number): Promise<Routine | null>;
<<<<<<< HEAD
=======
import { CreateRoutineDto } from './dto/create-routine.dto';
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
export declare class RoutineService {
    private routineRepository;
    constructor(routineRepository: Repository<Routine>);
    findAll(): Promise<Routine[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> c94d082 (✨ :: routine findOne 로직 추가 #KAN-257)
}
