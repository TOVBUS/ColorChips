import { Injectable } from '@nestjs/common';
import { CreateInbodyDto } from './dto/create-inbody.dto';
import { UpdateInbodyDto } from './dto/update-inbody.dto';

@Injectable()
export class InbodyService {
  create(createInbodyDto: CreateInbodyDto) {
    return 'This action adds a new inbody';
  }

  findAll() {
    return `This action returns all inbody`;
  }

  findOne(id: number) {
    return `This action returns a #${id} inbody`;
  }

  update(id: number, updateInbodyDto: UpdateInbodyDto) {
    return `This action updates a #${id} inbody`;
  }

  remove(id: number) {
    return `This action removes a #${id} inbody`;
  }
}
