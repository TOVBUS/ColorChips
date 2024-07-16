/*
import { Injectable } from '@nestjs/common';
import { MemberService } from '../member/member.service';
import { CreateMemberDto } from '../member/dto/create-member.dto';

@Injectable()
export class AuthService {
  constructor(private memberService: MemberService) {}

  async validateAppleUser(appleId: string, profile: any): Promise<any> {
    let member = await this.memberService.findByAppleId(appleId);
    if (!member) {
      const createMemberDto: CreateMemberDto = {
        nickname: `${profile.firstName} ${profile.lastName}`,
        gender: '',  // Apple doesn't provide gender information
        birth: new Date(),  // Apple doesn't provide birth information
        appleId: appleId,
      };
      member = await this.memberService.create(createMemberDto);
    }
    return member;
  }
}
*/
