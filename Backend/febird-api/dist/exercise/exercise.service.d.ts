import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';
import { CreateExerciseDto } from './dto/create-exercise.dto';
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    create(createExerciseDto: CreateExerciseDto): Promise<Exercise>;
    findAll(): Promise<Exercise[]>;
}
