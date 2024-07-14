import { Injectable } from '@nestjs/common';
import { ConfigService as NestConfigService } from '@nestjs/config';

@Injectable()
export class ConfigService {
  constructor(private nestConfigService: NestConfigService) {}

  get(key: string): string {
    return this.nestConfigService.get<string>(key);
  }

  getNumber(key: string): number {
    return Number(this.get(key));
  }

  getBoolean(key: string): boolean {
    return this.get(key) === 'true';
  }
}
