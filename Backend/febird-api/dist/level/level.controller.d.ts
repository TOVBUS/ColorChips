import { LevelService } from './level.service';
<<<<<<< HEAD
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    findAll(): Promise<import("./level.entity").Level[]>;
    findOne(id: number): Promise<import("./level.entity").Level>;
=======
import { CreateLevelDto } from './dto/create-level.dto';
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    create(createLevelDto: CreateLevelDto): Promise<import("./level.entity").Level>;
    findAll(): Promise<import("./level.entity").Level[]>;
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
