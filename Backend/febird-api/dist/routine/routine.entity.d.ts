import { Level } from '../level/level.entity';
import { Exercise } from '../exercise/exercise.entity';
export declare class Routine {
    routine_id: number;
    value: number;
    set: number;
    level: Level;
    exercise: Exercise;
}
