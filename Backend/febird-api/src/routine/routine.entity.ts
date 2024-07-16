import { Entity, Column, PrimaryGeneratedColumn, OneToMany, JoinColumn } from 'typeorm';
import { Level } from '../level/level.entity';
import { Exercise } from '../exercise/exercise.entity';

@Entity()
export class Routine {
  @PrimaryGeneratedColumn()
  routine_id: number;

  @Column({ length: 50 })
  count: string;

  @Column('text')
  set: string;

  @OneToMany(() => Level, (level) => level.routine)
  @JoinColumn({ name: 'level_id' })
  level: Level[];

  @OneToMany(() => Exercise, (exercise) => exercise.routines)
  @JoinColumn({ name: 'exercise_id' })
  exercise: Exercise[];
}