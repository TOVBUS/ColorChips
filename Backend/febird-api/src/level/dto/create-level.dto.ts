import { IsString, IsNotEmpty, IsUrl } from 'class-validator';

export class CreateLevelDto {
  @IsString()
  @IsNotEmpty()
  school_name: string;

  @IsString()
  @IsNotEmpty()
  @IsUrl()
  reward_url: string;
}
