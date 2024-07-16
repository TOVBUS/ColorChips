import { Module } from '@nestjs/common';
import { ConfigModule } from '@nestjs/config';
import { MemberModule } from './member/member.module';
import { DatabaseModule } from './database/database.module';
// import { ExerciseModule } from './exercise/exercise.module';
import { SchoolModule } from './school/school.module';
import { InbodyModule } from './inbody/inbody.module';
// import { ChatbotModule } from './chatbot/chatbot.module';

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    MemberModule,
    DatabaseModule,
    // ExerciseModule,
    SchoolModule,
    InbodyModule,
    // ChatbotModule,
  ],
})
export class AppModule {}
