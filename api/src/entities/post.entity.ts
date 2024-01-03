import {
    Column,
    Entity,
    ManyToOne,
    PrimaryGeneratedColumn
} from "typeorm"
import { User } from "./user.entity"

@Entity()
export class Post {
    @PrimaryGeneratedColumn()
    id: number

    @Column("text")
    title: string

    @Column({
        length: 140,
    })
    content: string

    @ManyToOne(() => User, (user) => user.posts)
    user: User
}