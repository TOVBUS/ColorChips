import { Inbody } from '../inbody/inbody.entity';
import { History } from '../history/history.entity';
export declare class Member {
    member_id: number;
    nickname: string;
    profile_image: string;
    age: number;
    gender: string;
    appleID: string;
    kakaoID: string;
    current_level: number;
    inbodies: Inbody[];
    histories: History[];
}
