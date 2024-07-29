import { Routine } from '../routine/routine.entity';
export declare class Exercise {
    exercise_id: number;
    exercise_name: string;
    video_guide_url: string;
    tip: string;
    type: string;
    routines: Routine[];
}
