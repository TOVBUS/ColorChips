import {
  Entity,
  Column,
  PrimaryGeneratedColumn,
  ManyToOne,
  JoinColumn,
} from 'typeorm';
import { Member } from '../member/member.entity'; // Member 엔티티 import
import { Level } from 'src/level/level.entity';

@Entity()
export class History {
  @PrimaryGeneratedColumn()
  history_id: number;

  @Column()
  achievement_level: number;

  @Column('date')
  achievement_date: Date;

  @Column({ length: 100 })
  achievement_reward: string;

  @Column({ length: 10 })
  achievement_school: string;

  @ManyToOne(() => Member, (member) => member.histories)
  @JoinColumn({ name: 'member_id' })
  member: Member;

  @ManyToOne(() => Level, (level) => level.histories)
  @JoinColumn({ name: 'level_id' })
  level: Level;
}