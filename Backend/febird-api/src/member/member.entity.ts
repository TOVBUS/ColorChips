import { Entity, Column, PrimaryGeneratedColumn, OneToMany } from 'typeorm';
import { Inbody } from '../inbody/inbody.entity'; // Inbody 엔티티 import
import { History } from '../history/history.entity'; // History 엔티티 import

@Entity()
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
  kaKaoID: string;

  @Column()
  current_level: number;

  @OneToMany(() => Inbody, (inbody) => inbody.member)
  inbodies: Inbody[];

  @OneToMany(() => History, (history) => history.member)
  histories: History[];
}
