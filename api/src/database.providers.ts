import { join } from 'path';
import { DataSource } from 'typeorm';

require('dotenv').config()

export const databaseProviders = [
  {
    provide: 'DATA_SOURCE',
    useFactory: async () => {
      const dataSource = new DataSource({
        type: 'postgres',
        host: process.env.AZURE_POSTGRESQL_HOST,
        port: +process.env.AZURE_POSTGRESQL_PORT,
        username: process.env.AZURE_POSTGRESQL_USER,
        password: process.env.AZURE_POSTGRESQL_PASSWORD,
        database: process.env.AZURE_POSTGRESQL_DATABASE,
        synchronize: true,
        ssl: process.env.AZURE_POSTGRESQL_SSL == 'true',
        logging: true,
        entities: [join(__dirname, '**', '*.entity.{ts,js}')],
      });

      return dataSource.initialize();
    },
  },
];
