import {
  Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn,
} from 'typeorm';
import { Level } from '../level/level.entity';
import { Exercise } from '../exercise/exercise.entity';

@Entity()
export class Routine {
  @PrimaryGeneratedColumn()
  routine_id: number;

  @Column()
  value: number;

  @Column()
  set: number;

  @ManyToOne(() => Level, (level) => level.routines)
  @JoinColumn({ name: 'level_id' })
  level: Level;

  @ManyToOne(() => Exercise, (exercise) => exercise.routines)
  @JoinColumn({ name: 'exercise_id' })
  exercise: Exercise;
}