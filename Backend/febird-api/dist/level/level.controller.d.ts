import { LevelService } from './level.service';
<<<<<<< HEAD
<<<<<<< HEAD
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    findAll(): Promise<import("./level.entity").Level[]>;
    findOne(id: number): Promise<import("./level.entity").Level>;
=======
import { CreateLevelDto } from './dto/create-level.dto';
=======
>>>>>>> 221e99d (✨ :: level의 FindOne 로직 예외처리 #KAN-257)
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    findAll(): Promise<import("./level.entity").Level[]>;
<<<<<<< HEAD
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    findOne(id: number): Promise<import("./level.entity").Level>;
>>>>>>> 221e99d (✨ :: level의 FindOne 로직 예외처리 #KAN-257)
}
