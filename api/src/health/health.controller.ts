import { Controller, Get } from '@nestjs/common';
import { Public } from 'src/auth/auth.guard';

@Controller('health')
export class HealthController {

    @Get()
    @Public()
    getHealthy(): string {
        return "Healthy";
    }

}
