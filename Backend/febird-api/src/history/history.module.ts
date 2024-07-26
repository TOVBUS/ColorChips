import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { History } from './history.entity';
import { HistoryService } from './history.service';
import { HistoryController } from './history.controller';
import { MemberModule } from '../member/member.module';
import { Member } from '../member/member.entity';
import { LevelModule } from '../level/level.module';
import { Level } from '../level/level.entity';

@Module({
  imports: [
    TypeOrmModule.forFeature([History, Member, Level]),
    MemberModule,
    LevelModule,
  ],
  controllers: [HistoryController],
  providers: [HistoryService],
  exports: [TypeOrmModule],
})
export class HistoryModule {}
