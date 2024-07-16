import { Test, TestingModule } from '@nestjs/testing';
import { InbodyService } from './inbody.service';

describe('InbodyService', () => {
  let service: InbodyService;

  beforeEach(async () => {
    const module: TestingModule = await Test.createTestingModule({
      providers: [InbodyService],
    }).compile();

    service = module.get<InbodyService>(InbodyService);
  });

  it('should be defined', () => {
    expect(service).toBeDefined();
  });
});
