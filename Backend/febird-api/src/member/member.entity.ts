import {
  Entity, Column, PrimaryGeneratedColumn, OneToMany, Unique 
} from 'typeorm';
import { Inbody } from '../inbody/inbody.entity';
import { History } from '../history/history.entity';

@Entity()
@Unique(['nickname'])
@Unique(['appleID'])
@Unique(['kakaoID'])
export class Member {
  @PrimaryGeneratedColumn()
  member_id: number;

  @Column({ length: 50 })
  nickname: string;

  @Column({ length: 255 })
  profile_image: string;

  @Column()
  age: number;

  @Column({ length: 10 })
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