import { RoutineService } from './routine.service';
export declare class RoutineController {
    private readonly routineService;
    constructor(routineService: RoutineService);
    findAll(): Promise<import("./routine.entity").Routine[]>;
}
