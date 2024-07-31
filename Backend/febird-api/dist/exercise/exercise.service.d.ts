import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';
<<<<<<< HEAD
<<<<<<< HEAD
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    findAll(): Promise<Exercise[]>;
    findOne(id: number): Promise<Exercise>;
=======
import { CreateExerciseDto } from './dto/create-exercise.dto';
=======
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    findAll(): Promise<Exercise[]>;
<<<<<<< HEAD
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    findOne(id: number): Promise<Exercise>;
>>>>>>> 589c371 (✨ :: exercise create 로직 삭제, findOne 로직 추가 #KAN-257)
}
