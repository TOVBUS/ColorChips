import { Entity, Column, PrimaryGeneratedColumn, ManyToOne } from 'typeorm';
import { Routine } from 'src/routine/routine.entity';

@Entity()
export class Level {
  @PrimaryGeneratedColumn()
  level_id: number;

  @Column({ length: 10 })
  school_name: string;

  @Column({ length: 100 })
  reward_url: string;

  @ManyToOne(() => Routine, (routine) => routine.level)
  routine: Routine
}