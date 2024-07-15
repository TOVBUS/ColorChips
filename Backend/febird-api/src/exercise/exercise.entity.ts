import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Exercise {
  @PrimaryGeneratedColumn()
  exercise_key: number;

  @Column()
  exercise_title: string;

  @Column()
  url: Text;

  @Column()
  tip: Text;
}
