import { Repository } from 'typeorm';
import { Exercise } from './exercise.entity';
export declare class ExerciseService {
    private exerciseRepository;
    constructor(exerciseRepository: Repository<Exercise>);
    findAll(): Promise<Exercise[]>;
    findOne(id: number): Promise<Exercise>;
}
