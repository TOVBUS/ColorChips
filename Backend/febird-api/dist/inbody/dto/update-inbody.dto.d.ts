import { CreateInbodyDto } from './create-inbody.dto';
declare const UpdateInbodyDto_base: import("@nestjs/common").Type<Partial<CreateInbodyDto>>;
export declare class UpdateInbodyDto extends UpdateInbodyDto_base {
    height?: number;
    weight?: number;
    inbody_date?: Date;
    bmr?: number;
    bodyfat?: number;
    bmi?: number;
}
export {};
