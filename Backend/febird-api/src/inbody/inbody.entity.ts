import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { Member } from '../member/member.entity'; // Member 엔티티 import

@Entity()
export class Inbody {
  @PrimaryGeneratedColumn()
  inbody_key: number;

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

  @OneToOne(() => Member, (member) => member.inbody)
  @JoinColumn({ name: 'uuid' })
  member: Member;
}
