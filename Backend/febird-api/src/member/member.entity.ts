import { Entity, Column, PrimaryGeneratedColumn, OneToOne } from 'typeorm';
import { Inbody } from '../inbody/inbody.entity'; // Inbody 엔티티 import
import { School } from '../school/school.entity'; // School 엔티티 import

@Entity()
export class Member {
  @PrimaryGeneratedColumn()
  uuid: number;

  @Column()
  nickname: string;

  @Column()
  gender: string;

  @Column()
  birth: Date;

  // apple id
  // @Column({ unique: true })
  // appleId: string;

  @OneToOne(() => Inbody, (inbody) => inbody.member)
  inbody: Inbody;

  @OneToOne(() => School, (school) => school.member)
  school: School;
}
