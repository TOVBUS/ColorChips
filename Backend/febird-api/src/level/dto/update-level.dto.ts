import { PartialType } from '@nestjs/swagger';
import { CreateLevelDto } from './create-level.dto';
import { IsString, IsNotEmpty, IsInt } from 'class-validator';

export class UpdateLevelDto extends PartialType(CreateLevelDto) {
    @IsString()
    @IsNotEmpty()
    school_name: string;

    @IsNotEmpty()
    @IsInt()
    grade: number;
}