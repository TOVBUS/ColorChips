import { ExerciseService } from './exercise.service';
<<<<<<< HEAD
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
    findOne(id: number): Promise<import("./exercise.entity").Exercise>;
=======
import { CreateExerciseDto } from './dto/create-exercise.dto';
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    create(createExerciseDto: CreateExerciseDto): Promise<import("./exercise.entity").Exercise>;
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
