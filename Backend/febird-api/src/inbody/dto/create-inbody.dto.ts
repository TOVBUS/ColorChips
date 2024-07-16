import { IsNumber, IsDate, IsUUID } from 'class-validator';

export class CreateInbodyDto {
  @IsNumber()
  height: number;

  @IsNumber()
  weight: number;

  @IsDate()
  inbody_date: Date;

  @IsNumber()
  bmr: number;

  @IsNumber()
  bodyfat: number;

  @IsNumber()
  bmi: number;

  @IsUUID()
  uuid: number; // Member의 uuid
}
