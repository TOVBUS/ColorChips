import { Routine } from 'src/routine/routine.entity';
import { History } from 'src/history/history.entity';
export declare class Level {
    level_id: number;
    school_name: string;
    grade: number;
    routines: Routine[];
    histories: History[];
}
