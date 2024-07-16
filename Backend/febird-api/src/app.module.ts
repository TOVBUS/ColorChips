import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MemberModule } from './member/member.module';
import { DatabaseModule } from './database/database.module';
import { HistoryModule } from './history/history.module';
import { InbodyModule } from './inbody/inbody.module';
import { LevelModule } from './level/level.module';
import { RoutineModule } from './routine/routine.module';
import { ExerciseModule } from './exercise/exercise.module';


@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    MemberModule,
    DatabaseModule,
    HistoryModule,
    InbodyModule,
    LevelModule,
    RoutineModule,
    ExerciseModule,
  ],
})
export class AppModule {}
