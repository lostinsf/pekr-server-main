import { NestFactory } from '@nestjs/core';
import {
  FastifyAdapter,
  NestFastifyApplication,
} from '@nestjs/platform-fastify';
import { SwaggerModule, DocumentBuilder } from '@nestjs/swagger';
import { AppModule } from './application/app.module';

async function bootstrap() {
  // Fastify 설정
  const app = await NestFactory.create<NestFastifyApplication>(
    AppModule,
    new FastifyAdapter(),
  );

  // swagger 설정
  const config = new DocumentBuilder()
    .setTitle('Pekr-server-main')
    .setDescription('Ability Test Server for Back-and-Development Initiation')
    .setVersion('0.1.0')
    .addTag('class')
    .build();
  const document = SwaggerModule.createDocument(app, config);
  SwaggerModule.setup('docs', app, document);

  // liston 설정
  await app.listen(5000);
}
bootstrap();
