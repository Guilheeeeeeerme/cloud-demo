import { Column, Entity, OneToMany, PrimaryGeneratedColumn } from "typeorm"
import { Post } from "./post.entity"

@Entity()
export class User {
    @PrimaryGeneratedColumn()
    id: number

    @Column()
    firstName: string

    @Column()
    lastName: string

    @Column()
    age: number

    @OneToMany(() => Post, (post) => post.user)
    posts: Post[]
}