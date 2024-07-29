import { CreateMemberDto } from './create-member.dto';
declare const UpdateMemberDto_base: import("@nestjs/mapped-types").MappedType<Partial<CreateMemberDto>>;
export declare class UpdateMemberDto extends UpdateMemberDto_base {
    nickname?: string;
    profile_image?: string;
    age?: number;
    gender?: string;
    appleID?: string;
    kakaoID?: string;
    current_level?: number;
}
export {};
