import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';
export declare class InbodyController {
    private inbodyService;
    constructor(inbodyService: InbodyService);
    create(memberId: number, createInbodyDto: CreateInbodyDto): Promise<import("./inbody.entity").Inbody>;
    findAll(memberId: number): Promise<import("./inbody.entity").Inbody[]>;
}
