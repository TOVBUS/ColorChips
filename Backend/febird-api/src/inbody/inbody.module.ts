import { Module } from '@nestjs/common';
import { InbodyService } from './inbody.service';
import { InbodyController } from './inbody.controller';

@Module({
  controllers: [InbodyController],
  providers: [InbodyService],
})
export class InbodyModule {}
