import { IsDate, IsNotEmpty, IsNumber } from 'class-validator';

export class CreateHistoryDto {
  @IsDate()
  @IsNotEmpty()
  achievement_date: Date;

  @IsNumber()
  @IsNotEmpty()
  member_id: number;

  @IsNumber()
  @IsNotEmpty()
  level_id: number;
}