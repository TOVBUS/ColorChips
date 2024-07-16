import { Test, TestingModule } from '@nestjs/testing';
import { InbodyController } from './inbody.controller';
import { InbodyService } from './inbody.service';

describe('InbodyController', () => {
  let controller: InbodyController;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      controllers: [InbodyController],
      providers: [InbodyService],
    }).compile();

    controller = module.get<InbodyController>(InbodyController);
  });

  it('should be defined', () => {
    expect(controller).toBeDefined();
  });
});
