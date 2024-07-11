import { Module } from '@nestjs/common';
import { MemberService } from './member.service';
import { MemberController } from './member.controller';

@Module({
  exports: [MemberService],
  controllers: [MemberController],
  providers: [MemberService],
})
export class MemberModule {}
