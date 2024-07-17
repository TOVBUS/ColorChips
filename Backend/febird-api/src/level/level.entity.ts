import { Entity, Column, PrimaryGeneratedColumn, ManyToOne, OneToMany } from 'typeorm';
import { Routine } from 'src/routine/routine.entity';
import { History } from 'src/history/history.entity';

@Entity()
export class Level {
  @PrimaryGeneratedColumn()
  level_id: number;

  @Column({ length: 10 })
  school_name: string;

  @ManyToOne(() => Routine, (routine) => routine.level)
  routine: Routine

  @OneToMany(() => History, (history) => history.level)
  histories: History[]
}