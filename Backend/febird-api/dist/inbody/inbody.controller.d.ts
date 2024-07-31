import { InbodyService } from './inbody.service';
import { CreateInbodyDto } from './dto/create-inbody.dto';
<<<<<<< HEAD
<<<<<<< HEAD
import { UpdateInbodyDto } from './dto/update-inbody.dto';
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
import { UpdateInbodyDto } from './dto/update-inbody.dto';
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
export declare class InbodyController {
    private inbodyService;
    constructor(inbodyService: InbodyService);
    create(memberId: number, createInbodyDto: CreateInbodyDto): Promise<import("./inbody.entity").Inbody>;
    findAll(memberId: number): Promise<import("./inbody.entity").Inbody[]>;
<<<<<<< HEAD
<<<<<<< HEAD
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<import("./inbody.entity").Inbody>;
=======
>>>>>>> d0bf1f6 (🐛 :: Fix Server Error)
=======
    update(memberId: number, inbodyId: number, updateInbodyDto: UpdateInbodyDto): Promise<import("./inbody.entity").Inbody>;
>>>>>>> 738ef6a (✨ :: Inbody update 로직 추가, routine create&update 로직 삭제 #KAN-257)
}
