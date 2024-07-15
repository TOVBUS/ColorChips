import { IsNumber, IsDate, IsOptional } from 'class-validator';

export class UpdateInbodyDto {
  @IsNumber()
  @IsOptional()
  height?: number;

  @IsNumber()
  @IsOptional()
  weight?: number;

  @IsDate()
  @IsOptional()
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
}
