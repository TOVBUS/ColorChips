import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { AuthModule } from './auth/auth.module';
import { MemberModule } from './member/member.module';
import { DatabaseModule } from './database/database.module';
import { HistoryModule } from './history/history.module';
import { InbodyModule } from './inbody/inbody.module';
import { LevelModule } from './level/level.module';
import { RoutineModule } from './routine/routine.module';
import { ExerciseModule } from './exercise/exercise.module';
import { ChatbotModule } from './chatbot/chatbot.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true, 
    }),
    AuthModule,
    MemberModule,
    DatabaseModule,
    HistoryModule,
    InbodyModule,
    LevelModule,
    RoutineModule,
    ExerciseModule,
    ChatbotModule
  ],
})
export class AppModule {}