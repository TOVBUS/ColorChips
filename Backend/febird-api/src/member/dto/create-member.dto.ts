import { IsNotEmpty, IsString, IsInt, IsOptional } from 'class-validator';

export class CreateMemberDto {
  @IsNotEmpty()
  @IsString()
  nickname: string;

  @IsNotEmpty()
  @IsString()
  profile_image: string;

  @IsNotEmpty()
  @IsInt()
  age: number;

  @IsNotEmpty()
  @IsString()
  gender: string;

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
