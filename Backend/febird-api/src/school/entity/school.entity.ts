import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class School {
  @PrimaryGeneratedColumn()
  school_key: number;

  @Column()
  school_title: string;

  @Column()
  grade: string;

  @Column()
  admission: Date;

  @Column()
  graduation: Date;
}
