import { RoutineService } from './routine.service';
<<<<<<< HEAD
<<<<<<< HEAD
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    findAll(): Promise<import("./routine.entity").Routine[]>;
    findOne(id: number): Promise<import("./routine.entity").Routine>;
<<<<<<< HEAD
=======
import { CreateRoutineDto } from './dto/create-routine.dto';
=======
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    findAll(): Promise<import("./routine.entity").Routine[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
>>>>>>> c94d082 (✨ :: routine findOne 로직 추가 #KAN-257)
}
