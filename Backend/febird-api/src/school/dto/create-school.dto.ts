import {
  IsNotEmpty,
  IsString,
  IsDate,
  IsNumber,
  IsUUID,
} from 'class-validator';

export class CreateSchoolDto {
  @IsNotEmpty()
  @IsString()
  school_title: string;

  @IsNotEmpty()
  @IsNumber()
  grade: number;

  @IsNotEmpty()
  @IsString()
  gender: string;

  @IsNotEmpty()
  @IsDate()
  admission: Date;

  @IsNotEmpty()
  @IsDate()
  graduation: Date;

  @IsUUID()
  uuid: number; // Member의 uuid
}
