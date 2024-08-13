import { Injectable } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';

@Injectable()
export class AuthService {
  constructor(private readonly jwtService: JwtService) {}

  async generateToken(member_id: number): Promise<string> {
    const payload = { member_id };
    return this.jwtService.sign(payload);
  }
}