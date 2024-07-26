import { IsNotEmpty, IsNumber, IsString, IsInt } from 'class-validator';

export class CreateLevelDto {
  @IsString()
  @IsNotEmpty()
  school_name: string;

  @IsNotEmpty()
  @IsInt()
  grade: number;

  @IsNumber()
  @IsNotEmpty()
  routine_id: number;
}
