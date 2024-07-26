import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { Routine } from '../routine/routine.entity';

@Entity()
export class Exercise {
  @PrimaryGeneratedColumn()
  exercise_id: number;

  @Column({ length: 50 })
  exercise_name: string;

  @Column({ length: 255 })
  video_guide_url: string;

  @Column('text')
  tip: string;

  @Column({ length: 3 })
  type: string;

  @OneToMany(() => Routine, (routine) => routine.exercise)
  routines: Routine[];
}
