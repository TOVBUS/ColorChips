import { LevelService } from './level.service';
import { CreateLevelDto } from './dto/create-level.dto';
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    create(createLevelDto: CreateLevelDto): Promise<import("./level.entity").Level>;
    findAll(): Promise<import("./level.entity").Level[]>;
}
