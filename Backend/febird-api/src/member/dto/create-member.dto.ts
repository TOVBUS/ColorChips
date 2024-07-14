import { IsNotEmpty, IsString, IsDate } from 'class-validator';

export class CreateMemberDto {
  @IsNotEmpty()
  @IsString()
  nickname: string;

  @IsNotEmpty()
  @IsString()
  gender: string;

  @IsNotEmpty()
  @IsDate()
  birth: Date;

  // @IsNotEmpty()
  // @IsString()
  // appleId: string;
}
