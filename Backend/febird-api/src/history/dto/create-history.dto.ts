import { IsNotEmpty, IsDateString, IsInt } from 'class-validator';

export class CreateHistoryDto {
  @IsDateString()
  @IsNotEmpty()
  achievement_date: Date;

  @IsInt()
  @IsNotEmpty()
  member_id: number; // member의 FK
}