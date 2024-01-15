import { Module } from '@nestjs/common';
import { HealthModule } from './health/health.module';
import { AuthModule } from './auth/auth.module';
import { UsersModule } from './users/users.module';
import { CommentsModule } from './comments/comments.module';

@Module({
  imports: [HealthModule, AuthModule, UsersModule, CommentsModule],
})
export class AppModule {}
