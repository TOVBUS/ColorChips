import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { Member } from '../member/member.entity';

@Entity()
export class Inbody {
  @PrimaryGeneratedColumn()
  inbody_id: number;

  @Column('float')
  height: number;

  @Column('float')
  weight: number;

  @Column()
  inbody_date: Date;

  @Column('float')
  bmr: number;

  @Column('float')
  bodyfat: number;

  @Column('float')
  bmi: number;

  @ManyToOne(() => Member, (member) => member.inbodies)
  @JoinColumn({ name: 'member_id' })
  member: Member;
}