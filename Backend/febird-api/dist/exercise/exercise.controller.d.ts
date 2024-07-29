import { ExerciseService } from './exercise.service';
import { CreateExerciseDto } from './dto/create-exercise.dto';
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    create(createExerciseDto: CreateExerciseDto): Promise<import("./exercise.entity").Exercise>;
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
}
