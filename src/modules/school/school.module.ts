import { Module } from '@nestjs/common';
import { SchoolController } from './school.controller';
import { SchoolService } from './school.service';
import { PrismaModule } from '../prisma/prisma.module';  // Import PrismaModule
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [SchoolController],
  providers: [SchoolService,PrismaService],
  imports: [PrismaModule],  // Add PrismaModule to imports
  exports: [SchoolService],
})
export class SchoolModule {}
