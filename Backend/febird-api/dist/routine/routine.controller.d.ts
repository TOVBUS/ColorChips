import { RoutineService } from './routine.service';
<<<<<<< HEAD
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    findAll(): Promise<import("./routine.entity").Routine[]>;
    findOne(id: number): Promise<import("./routine.entity").Routine>;
=======
import { CreateRoutineDto } from './dto/create-routine.dto';
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    create(createRoutineDto: CreateRoutineDto): Promise<import("./routine.entity").Routine>;
    findAll(): Promise<import("./routine.entity").Routine[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
