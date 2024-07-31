import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { Level } from './level.entity';
import { LevelService } from './level.service';
import { LevelController } from './level.controller';
import { Routine } from '../routine/routine.entity';
import { RoutineModule } from '../routine/routine.module';

@Module({
  imports: [
    TypeOrmModule.forFeature([Level, Routine]),
    RoutineModule
  ],
  providers: [LevelService],
  controllers: [LevelController],
  exports: [LevelService],
})
export class LevelModule {}