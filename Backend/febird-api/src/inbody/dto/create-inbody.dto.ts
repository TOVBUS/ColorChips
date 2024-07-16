import { IsInt, IsDate} from 'class-validator';

export class CreateInbodyDto {
  @IsInt()
  height: number;

  @IsInt()
  weight: number;

  @IsDate()
  inbody_date: Date;

  @IsInt()
  bmr: number;

  @IsInt()
  bodyfat: number;

  @IsInt()
  bmi: number;

  @IsInt()
  member_id: number; 
}
