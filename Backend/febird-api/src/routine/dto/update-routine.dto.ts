import { PartialType } from '@nestjs/swagger';
import { CreateRoutineDto } from './create-routine.dto';
import { IsString, IsNotEmpty } from 'class-validator';

export class UpdateRoutineDto extends PartialType(CreateRoutineDto) {
    @IsString()
    @IsNotEmpty()
    count: string;

    @IsString()
    @IsNotEmpty()
    set: string;
}
