import { IsString, IsNotEmpty, IsArray } from 'class-validator';
import { CreateLevelDto } from '../../level/dto/create-level.dto';
import { CreateExerciseDto } from '../../exercise/dto/create-exercise.dto';

export class CreateRoutineDto {
  @IsString()
  @IsNotEmpty()
  count: string;

  @IsString()
  @IsNotEmpty()
  set: string;

  @IsArray()
  levels: CreateLevelDto[];

  @IsArray()
  exercises: CreateExerciseDto[];
}
