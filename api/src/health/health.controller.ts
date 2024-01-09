import { Controller, Get } from '@nestjs/common';

@Controller('health')
export class HealthController {

    @Get()
    getHealthy(): string {
        return "Healthy";
    }

}
