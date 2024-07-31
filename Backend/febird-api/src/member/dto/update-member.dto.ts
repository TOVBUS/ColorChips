import { PartialType } from '@nestjs/mapped-types';
import { CreateMemberDto } from './create-member.dto';
import { IsInt, IsOptional, IsString } from 'class-validator';

export class UpdateMemberDto extends PartialType(CreateMemberDto) {
  @IsOptional()
  @IsString()
  nickname?: string;

  @IsOptional()
  @IsString()
  profile_image?: string;

  @IsOptional()
  @IsInt()
  age?: number;

  @IsOptional()
  @IsString()
  gender?: string;

  @IsOptional()
  @IsString()
  appleID?: string;

  @IsOptional()
  @IsString()
  kakaoID?: string;

  @IsOptional()
  @IsInt()
  current_level?: number;
}