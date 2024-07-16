import { IsNotEmpty, IsString, IsInt } from 'class-validator';

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

  @IsNotEmpty()
  @IsString()
  appleID: string;

  @IsNotEmpty()
  @IsString()
  kakaoID: string;

  @IsNotEmpty()
  @IsInt()
  current_level: number;
}
