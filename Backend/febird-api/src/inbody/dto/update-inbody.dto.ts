import { PartialType } from '@nestjs/swagger';
import { CreateInbodyDto } from './create-inbody.dto';
import { IsInt, IsDate, IsOptional } from 'class-validator';

export class UpdateInbodyDto extends PartialType(CreateInbodyDto) {
  @IsInt()
  @IsOptional()
  height?: number;

  @IsInt()
  @IsOptional()
  weight?: number;

  @IsDate()
  @IsOptional()
  inbody_date?: Date;

  @IsInt()
  @IsOptional()
  bmr?: number;

  @IsInt()
  @IsOptional()
  bodyfat?: number;

  @IsInt()
  @IsOptional()
  bmi?: number;
}
