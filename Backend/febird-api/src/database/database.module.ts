import { Module } from '@nestjs/common';
import { TypeOrmModule } from '@nestjs/typeorm';
import { ConfigModule, ConfigService } from '@nestjs/config';
import { Member } from '../member/entity/member.entity';
// import { Exercise } from '../routine/routin'; - Azure 블롭 스토리지 연결 필요

@Module({
  imports: [
    ConfigModule.forRoot({
      isGlobal: true,
    }),
    TypeOrmModule.forRootAsync({
      imports: [ConfigModule],
      useFactory: (configService: ConfigService) => ({
        type: 'mysql',
        host: configService.get('DB_HOST'),
        port: configService.get('DB_PORT'),
        username: configService.get('DB_USERNAME'),
        password: configService.get('DB_PASSWORD'),
        database: configService.get('DB_DATABASE'),
        entities: [Member],
        synchronize: true, //추후 false로 변경 필요
      }),
      inject: [ConfigService],
    }),
    TypeOrmModule.forFeature([Member]),
  ],
  exports: [TypeOrmModule],
})
export class DatabaseModule {}
