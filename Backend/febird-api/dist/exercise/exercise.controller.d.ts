import { ExerciseService } from './exercise.service';
<<<<<<< HEAD
<<<<<<< HEAD
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
    findOne(id: number): Promise<import("./exercise.entity").Exercise>;
=======
import { CreateExerciseDto } from './dto/create-exercise.dto';
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
export declare class ExerciseController {
    private readonly exerciseService;
    constructor(exerciseService: ExerciseService);
    findAll(): Promise<import("./exercise.entity").Exercise[]>;
<<<<<<< HEAD
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    findOne(id: number): Promise<import("./exercise.entity").Exercise>;
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
}
