import { LevelService } from './level.service';
export declare class LevelController {
    private readonly levelService;
    constructor(levelService: LevelService);
    findAll(): Promise<import("./level.entity").Level[]>;
    findOne(id: number): Promise<import("./level.entity").Level>;
}
