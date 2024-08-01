import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';
<<<<<<< HEAD
import { UpdateInbodyDto } from './dto/update-inbody.dto';
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
export declare class InbodyController {
    private inbodyService;
    constructor(inbodyService: InbodyService);
    create(memberId: number, createInbodyDto: CreateInbodyDto): Promise<import("./inbody.entity").Inbody>;
    findAll(memberId: number): Promise<import("./inbody.entity").Inbody[]>;
<<<<<<< HEAD
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<import("./inbody.entity").Inbody>;
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
}
