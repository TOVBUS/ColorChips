import { Module } from '@nestjs/common';
import { AppController } from './app.controller';
import { AppService } from './app.service';
import { MemberController } from './member/member.controller';
import { MemberService } from './member/member.service';
import { MemberModule } from './member/member.module';

@Module({
  imports: [MemberModule],
  controllers: [AppController, MemberController],
  providers: [AppService, MemberService],
})
export class AppModule {}
