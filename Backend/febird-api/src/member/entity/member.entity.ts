import { Entity, Column, PrimaryGeneratedColumn } from 'typeorm';

@Entity()
export class Member {
  @PrimaryGeneratedColumn()
  id: number;

  @Column()
  nickname: string;

  @Column()
  gender: string;

  @Column()
  birth: Date;

  // @Column({ unique: true })
  // appleId: string;
}

// school, inbody 관계 설정
