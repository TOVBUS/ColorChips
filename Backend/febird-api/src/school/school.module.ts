import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { School } from './school.entity';
import { SchoolService } from './school.service';
import { SchoolController } from './school.controller';
import { MemberModule } from '../member/member.module';

@Module({
  imports: [TypeOrmModule.forFeature([School]),MemberModule,],
  controllers: [SchoolController],
  providers: [SchoolService],
  exports: [TypeOrmModule],
})
export class SchoolModule {}
