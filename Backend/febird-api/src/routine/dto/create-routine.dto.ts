import { IsNotEmpty, IsArray, IsNumber } from 'class-validator';
import { CreateLevelDto } from '../../level/dto/create-level.dto';
import { CreateExerciseDto } from '../../exercise/dto/create-exercise.dto';

export class CreateRoutineDto {
  @IsNumber()
  @IsNotEmpty()
  value: number;

  @IsNumber()
  @IsNotEmpty()
  set: number;

  @IsArray()
  @IsNotEmpty()
  levels: CreateLevelDto[];

  @IsArray()
  @IsNotEmpty()
  exercises: CreateExerciseDto[];
}
