import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { Routine } from 'src/routine/routine.entity';
import { History } from 'src/history/history.entity';

@Entity()
export class Level {
  @PrimaryGeneratedColumn()
  level_id: number;

  @Column({ length: 50 })
  school_name: string;

  @Column()
  grade: number;

  @OneToMany(() => Routine, (routine) => routine.level)
  routines: Routine[];

  @OneToMany(() => History, (history) => history.level)
  histories: History[];
}
