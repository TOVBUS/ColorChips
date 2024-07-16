import { IsString, IsOptional } from 'class-validator';

export class UpdateExerciseDto {
  @IsString()
  @IsOptional()
  exercise_title?: string;

  @IsString()
  @IsOptional()
  url?: string;

  @IsString()
  @IsOptional()
  tip?: string;
}
