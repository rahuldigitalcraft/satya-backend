// import { Module } from '@nestjs/common';
// import { BlockController } from '../block/block.controller'
// import {BlockService}  from '../block/block.service'

// import { PrismaModule } from '../prisma/prisma.module';


// @Module({
//   controllers: [BlockController],
//   providers: [BlockService],
//   imports: [PrismaModule],
//   exports: [BlockService],
// })
// export class BlockModule {}

import { Module } from '@nestjs/common';
import { BlockController } from './block.controller';
import { BlockService } from './block.service';
import { PrismaModule } from '../prisma/prisma.module';  // Import PrismaModule
import { PrismaService } from '../prisma/prisma.service';

@Module({
  controllers: [BlockController],
  providers: [BlockService,PrismaService],
  imports: [PrismaModule],  // Add PrismaModule to imports
  exports: [BlockService],
})
export class BlockModule {}

