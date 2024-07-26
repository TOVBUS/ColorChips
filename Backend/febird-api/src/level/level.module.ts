import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Level } from './level.entity';
import { LevelService } from './level.service';
import { LevelController } from './level.controller';
import { Routine } from '../routine/routine.entity'; // Routine 엔티티 import
import { RoutineModule } from '../routine/routine.module'; // RoutineModule import

@Module({
  imports: [
    TypeOrmModule.forFeature([Level, Routine]),
    RoutineModule, // RoutineModule 추가
  ],
  providers: [LevelService],
  controllers: [LevelController],
  exports: [LevelService],
})
export class LevelModule {}
