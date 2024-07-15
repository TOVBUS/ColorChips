import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  OneToOne,
  JoinColumn,
} from 'typeorm';
import { Member } from '../member/member.entity'; // Member 엔티티 import

@Entity()
export class School {
  @PrimaryGeneratedColumn()
  school_key: number;

  @Column()
  school_title: string;

  @Column()
  grade: number;

  @Column()
  admission: Date;

  @Column()
  graduation: Date;

  @OneToOne(() => Member, (member) => member.inbody)
  @JoinColumn({ name: 'uuid' })
  member: Member;
}
