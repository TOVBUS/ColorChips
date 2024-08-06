import {
  Entity, Column, PrimaryGeneratedColumn, OneToMany, Unique 
} from 'typeorm';
import { Inbody } from '../inbody/inbody.entity';
import { History } from '../history/history.entity';

@Entity()
@Unique(['appleID'])
@Unique(['kakaoID'])
export class Member {
  @PrimaryGeneratedColumn()
  member_id: number;

  @Column({ length: 50, nullable: true })
  nickname: string;

  @Column({ length: 255, nullable: true })
  profile_image: string;

  @Column({ nullable: true})
  age: number;

  @Column({ length: 10, nullable: true })
  gender: string;

  @Column({ length: 255, nullable: true })
  appleID: string;

  @Column({ length: 255, nullable: true })
  kakaoID: string;

  @Column({default: 1})
  current_level: number;

  @OneToMany(() => Inbody, (inbody) => inbody.member)
  inbodies: Inbody[];

  @OneToMany(() => History, (history) => history.member)
  histories: History[];
}