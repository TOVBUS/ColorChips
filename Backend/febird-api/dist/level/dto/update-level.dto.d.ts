import { CreateLevelDto } from './create-level.dto';
declare const UpdateLevelDto_base: import("@nestjs/common").Type<Partial<CreateLevelDto>>;
export declare class UpdateLevelDto extends UpdateLevelDto_base {
    school_name: string;
    grade: number;
}
export {};
