import { Member } from '../member/member.entity';
import { Level } from 'src/level/level.entity';
export declare class History {
    history_id: number;
    achievement_date: Date;
    member: Member;
    level: Level;
}
