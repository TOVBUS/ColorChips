import { Member } from '../member/member.entity';
export declare class Inbody {
    inbody_id: number;
    height: number;
    weight: number;
    inbody_date: Date;
    bmr: number;
    bodyfat: number;
    bmi: number;
    member: Member;
}
