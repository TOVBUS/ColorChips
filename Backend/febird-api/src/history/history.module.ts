import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { History } from './history.entity';
import { HistoryService } from './history.service';
import { HistoryController } from './history.controller';
import { MemberModule } from '../member/member.module';
import { Member } from '../member/member.entity';

@Module({
  imports: [TypeOrmModule.forFeature([History, Member]),MemberModule],
  controllers: [HistoryController],
  providers: [HistoryService],
  exports: [TypeOrmModule],
})
export class HistoryModule {}