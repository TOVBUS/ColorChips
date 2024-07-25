import { IsString, IsNotEmpty } from 'class-validator';

export class CreateExerciseDto {
  @IsString()
  @IsNotEmpty()
  exercise_name: string;

  @IsString()
  @IsNotEmpty()
  url: string;

  @IsString()
  @IsNotEmpty()
  tip: string;
}