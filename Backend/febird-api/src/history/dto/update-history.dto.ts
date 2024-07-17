import { PartialType } from '@nestjs/mapped-types';
import { CreateHistoryDto } from './create-history.dto';
import { IsOptional, IsDateString, IsNumber } from 'class-validator';
 
export class UpdateHistoryDto extends PartialType(CreateHistoryDto) {
  @IsDateString()
  @IsOptional()
  achievement_date?: Date;

  @IsNumber()
  @IsOptional()
  member_id?: number;
}
