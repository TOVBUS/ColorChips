import { IsNotEmpty, IsString, IsInt, IsOptional } from 'class-validator';

export class CreateMemberDto {
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

  @IsNotEmpty()
  @IsInt()
  current_level: number;
}