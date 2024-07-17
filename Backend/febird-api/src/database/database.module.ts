import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Member } from '../member/member.entity';
import { History } from '../history/history.entity';
import { Inbody } from '../inbody/inbody.entity'; 
import { Level } from '../level/level.entity';
import { Routine } from '../routine/routine.entity';
import { Exercise } from '../exercise/exercise.entity';  //  - Azure 블롭 스토리지 연결 필요

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (configService: ConfigService) => {
        const host = configService.get('DB_HOST');
        const port = configService.get('DB_PORT');
        const username = configService.get('DB_USERNAME');
        const password = configService.get('DB_PASSWORD');
        const database = configService.get('DB_DATABASE');

        if (!host || !port || !username || !password || !database) {
          throw new Error(
            'Database configuration is incomplete. Check your .env file.',
          );
        }

        return {
          type: 'mysql',
          host,
          port: parseInt(port, 3306),
          username,
          password,
          database,
          entities: [Member, History, Inbody, Level, Routine, Exercise],
          synchronize: true, //추후 false로 변경 필요
        };
      },
      inject: [ConfigService],
    }),
    TypeOrmModule.forFeature([Member, History, Inbody, Level, Routine, Exercise ]),
  ],
  exports: [TypeOrmModule],
})
export class DatabaseModule {}