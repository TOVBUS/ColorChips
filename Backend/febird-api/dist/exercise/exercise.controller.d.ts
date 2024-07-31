import { ExerciseService } from './exercise.service';
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
    findOne(id: number): Promise<import("./exercise.entity").Exercise>;
}
