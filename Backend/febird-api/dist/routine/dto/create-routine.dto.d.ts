import { CreateLevelDto } from '../../level/dto/create-level.dto';
import { CreateExerciseDto } from '../../exercise/dto/create-exercise.dto';
export declare class CreateRoutineDto {
    value: number;
    set: number;
    levels: CreateLevelDto[];
    exercises: CreateExerciseDto[];
}
