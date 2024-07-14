import { Module } from '@nestjs/common';
import { MemberService } from './member.service';
import { MemberController } from './member.controller';
import { Member } from './entity/member.entity';
import { TypeOrmModule } from '@nestjs/typeorm';

@Module({
  imports: [TypeOrmModule.forFeature([Member])],
  exports: [TypeOrmModule],
  controllers: [MemberController],
  providers: [MemberService],
})
export class MemberModule {}
