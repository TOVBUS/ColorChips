import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';
<<<<<<< HEAD
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    findAll(): Promise<Exercise[]>;
    findOne(id: number): Promise<Exercise>;
=======
import { CreateExerciseDto } from './dto/create-exercise.dto';
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    create(createExerciseDto: CreateExerciseDto): Promise<Exercise>;
    findAll(): Promise<Exercise[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
