import { Controller } from '@nestjs/common';
import { MemberService } from './member.service';
// import { CreateMemberDto } from './dto/create-member.dto';
// import { UpdateMemberDto } from './dto/update-member.dto';

@Controller('member')
export class MemberController {
  constructor(private readonly memberService: MemberService) {}
}
