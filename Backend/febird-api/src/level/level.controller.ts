<<<<<<< HEAD
<<<<<<< HEAD
import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';
=======
import { Controller, Get, Post, Body, Patch, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';
import { CreateLevelDto } from './dto/create-level.dto';
import { UpdateLevelDto } from './dto/update-level.dto'; // UpdateLevelDto를 추가
>>>>>>> 82dded9 (✨ :: level의 FindOne, FindAll 로직만 남기기 #KAN-257)
=======
import { Controller, Get, Param, NotFoundException } from '@nestjs/common';
import { LevelService } from './level.service';
>>>>>>> 221e99d (✨ :: level의 FindOne 로직 예외처리 #KAN-257)

@Controller('level')
export class LevelController {
  constructor(private readonly levelService: LevelService) {}

  @Get()
  findAll() {
    return this.levelService.findAll();
  }

<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> 82dded9 (✨ :: level의 FindOne, FindAll 로직만 남기기 #KAN-257)
  @Get(':id')
  async findOne(@Param('id') id: number) {
    try {
      return await this.levelService.findOne(id);
    } catch (error) {
      throw new NotFoundException(`Level with ID ${id} not found`);
    }
  }
<<<<<<< HEAD
<<<<<<< HEAD
}
=======
  //findOne(@Param('id') id: string) {}
  //update(@Param('id') id: string, @Body() updateLevelDto: UpdateLevelDto) {}
=======
>>>>>>> 82dded9 (✨ :: level의 FindOne, FindAll 로직만 남기기 #KAN-257)
}
>>>>>>> a351c7e (✨ :: Member에 FindOne 추가, Deletle 예외처리 추가 #KAN-257)
=======
}
>>>>>>> 9b09117 (🗑️ :: Member & Level 필요없는 코드, 주석, 띄어쓰기 삭제 #KAN-257)
