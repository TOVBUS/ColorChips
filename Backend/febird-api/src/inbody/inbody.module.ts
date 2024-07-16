import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Inbody } from './inbody.entity';
import { InbodyService } from './inbody.service';
import { InbodyController } from './inbody.controller';
import { MemberModule } from '../member/member.module';

@Module({
  imports: [TypeOrmModule.forFeature([Inbody]),MemberModule,],
  controllers: [InbodyController],
  providers: [InbodyService],
  exports: [TypeOrmModule]
})
export class InbodyModule {}
