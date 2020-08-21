import {
  Column,
  Entity,
  Index,
  JoinColumn,
  ManyToOne,
  OneToMany,
  PrimaryGeneratedColumn,
  BaseEntity,
} from "typeorm";
import { User } from "./user";
import { Value } from "./value";

@Index("name_UNIQUE", ["name"], { unique: true })
@Index("fk_Stations_Users_idx", ["userId"], {})
@Entity("Stations", { schema: "weather-station" })
export class Station extends BaseEntity {
  @PrimaryGeneratedColumn({ type: "bigint", name: "id" })
  id: string;

  @Column("varchar", { name: "name", unique: true, length: 50 })
  name: string;

  @Column("bigint", { name: "userId" })
  userId: string;

  @Column("datetime", { name: "createdAt", default: () => "CURRENT_TIMESTAMP" })
  createdAt: Date;

  @Column("datetime", { name: "updatedAt", default: () => "CURRENT_TIMESTAMP" })
  updatedAt: Date;

  @Column("float", { name: "lat", nullable: true, precision: 12 })
  lat: number | null;

  @Column("float", { name: "lon", nullable: true, precision: 12 })
  lon: number | null;

  @Column("float", { name: "accuracy", nullable: true, precision: 12 })
  accuracy: number | null;

  @ManyToOne(() => User, (users) => users.stations, {
    onDelete: "NO ACTION",
    onUpdate: "NO ACTION",
  })
  @JoinColumn([{ name: "userId", referencedColumnName: "id" }])
  user: User;

  @OneToMany(() => Value, (values) => values.station)
  values: Value[];
}