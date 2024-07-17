import { IsNotEmpty, IsDateString, IsInt, IsString } from 'class-validator';

export class CreateHistoryDto {
  @IsDateString()
  @IsNotEmpty()
  achievement_date: Date;

  @IsNotEmpty()
  @IsInt()
  achievement_level: number;

  @IsString()
  @IsNotEmpty()
  achievement_reward: string;

  @IsString()
  @IsNotEmpty()
  achievement_school: string;

  @IsInt()
  @IsNotEmpty()
  member_id: number; // member의 FK
}