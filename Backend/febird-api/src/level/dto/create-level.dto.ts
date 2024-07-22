import { IsNotEmpty, IsNumber, IsString } from 'class-validator';

export class CreateLevelDto {
  @IsString()
  @IsNotEmpty()
  school_name: string;

  @IsNumber()
  @IsNotEmpty()
  routine_id: number; 
}