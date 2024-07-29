"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.Level = void 0;
const typeorm_1 = require("typeorm");
const routine_entity_1 = require("../routine/routine.entity");
const history_entity_1 = require("../history/history.entity");
let Level = class Level {
};
exports.Level = Level;
__decorate([
    (0, typeorm_1.PrimaryGeneratedColumn)(),
    __metadata("design:type", Number)
], Level.prototype, "level_id", void 0);
__decorate([
    (0, typeorm_1.Column)({ length: 50 }),
    __metadata("design:type", String)
], Level.prototype, "school_name", void 0);
__decorate([
    (0, typeorm_1.Column)(),
    __metadata("design:type", Number)
], Level.prototype, "grade", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => routine_entity_1.Routine, (routine) => routine.level),
    __metadata("design:type", Array)
], Level.prototype, "routines", void 0);
__decorate([
    (0, typeorm_1.OneToMany)(() => history_entity_1.History, (history) => history.level),
    __metadata("design:type", Array)
], Level.prototype, "histories", void 0);
exports.Level = Level = __decorate([
    (0, typeorm_1.Entity)()
], Level);
//# sourceMappingURL=level.entity.js.map