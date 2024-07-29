import { RoutineService } from './routine.service';
import { CreateRoutineDto } from './dto/create-routine.dto';
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    create(createRoutineDto: CreateRoutineDto): Promise<import("./routine.entity").Routine>;
    findAll(): Promise<import("./routine.entity").Routine[]>;
}
