import {
  Entity, Column, PrimaryGeneratedColumn, ManyToOne, JoinColumn
} from 'typeorm';
import { Member } from '../member/member.entity';
import { Level } from 'src/level/level.entity';

@Entity()
export class History {
  @PrimaryGeneratedColumn()
  history_id: number;

  @Column('date')
  achievement_date: Date;

  @ManyToOne(() => Member, (member) => member.histories)
  @JoinColumn({ name: 'member_id' })
  member: Member;

  @ManyToOne(() => Level, (level) => level.histories)
  @JoinColumn({ name: 'level_id' })
  level: Level;
}