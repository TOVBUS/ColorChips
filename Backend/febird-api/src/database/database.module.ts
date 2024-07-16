import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Member } from '../member/member.entity';
import { School } from '../school/school.entity';
import { Inbody } from '../inbody/inbody.entity';
// import { Exercise } from '../exercise/exercise.entity';
//  - Azure 블롭 스토리지 연결 필요

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
          port: parseInt(port, 10),
          username,
          password,
          database,
          entities: [Member, School, Inbody],
          synchronize: true, //추후 false로 변경 필요
        };
      },
      inject: [ConfigService],
    }),
    TypeOrmModule.forFeature([Member, School, Inbody]),
  ],
  exports: [TypeOrmModule],
})
export class DatabaseModule {}
