import { IsString, IsNotEmpty } from 'class-validator';

export class CreateExerciseDto {
  @IsString()
  @IsNotEmpty()
  exercise_name: string;

  @IsString()
  @IsNotEmpty()
  video_guide_url: string;

  @IsString()
  @IsNotEmpty()
  tip: string;

  @IsString()
  @IsNotEmpty()
  type: string;
}
