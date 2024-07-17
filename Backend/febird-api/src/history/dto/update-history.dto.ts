import { PartialType } from '@nestjs/mapped-types';
import { CreateHistoryDto } from './create-history.dto';
import { IsOptional, IsDateString } from 'class-validator';
 
export class UpdateHistoryDto extends PartialType(CreateHistoryDto) {
  @IsDateString()
  @IsOptional()
  achievement_date?: Date;
}
