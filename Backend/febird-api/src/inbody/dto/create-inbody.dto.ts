import { IsNumber, IsDate, IsNotEmpty, IsOptional } from 'class-validator';
import { Type } from 'class-transformer';

export class CreateInbodyDto {
  @IsNumber()
  @IsNotEmpty()
  height: number;

  @IsNumber()
  @IsNotEmpty()
  weight: number;

  @IsDate()
  @IsOptional()
  @Type(() => Date)
  inbody_date?: Date;

  @IsNumber()
  @IsOptional()
  bmr?: number;

  @IsNumber()
  @IsOptional()
  bodyfat?: number;

  @IsNumber()
  @IsOptional()
  bmi?: number;

  @IsNumber()
  @IsNotEmpty()
  member_id: number; 
}
