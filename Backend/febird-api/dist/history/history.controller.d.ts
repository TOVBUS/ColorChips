import { HistoryService } from './history.service';
import { CreateHistoryDto } from './dto/create-history.dto';
export declare class HistoryController {
    private readonly historyService;
    constructor(historyService: HistoryService);
    create(memberId: number, createHistoryDto: CreateHistoryDto): Promise<import("./history.entity").History>;
    findAll(memberId: number): Promise<import("./history.entity").History[]>;
}
