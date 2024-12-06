import { BlockService } from './block.service';
import { Body, Controller, Get, Post, Put, Delete, Param,ParseIntPipe } from '@nestjs/common';
import { CreateNewBlockDto } from './create-new-block.dto';
import { ResponseModel } from 'src/shared/models/response.model';

@Controller('block')
export class BlockController {
  constructor(private readonly blockService: BlockService) {}

  @Post('store')
  createNewBlock(@Body() payload: any) {
    return this.blockService.createNewBlock(payload);
  }

  @Get('/')
  async getAllBlocks() {
    return this.blockService.getAllBlocks();
  }

@Put(':id') 
async updateBlock(
  @Param('id') id: string, 
  @Body() payload: CreateNewBlockDto 
): Promise<ResponseModel> {
  return this.blockService.updateBlock(id, payload);
}


@Delete(':id') 
async deleteBlock(@Param('id') id: string): Promise<ResponseModel> {
  return this.blockService.deleteBlock(id);
}


@Post('delete-all') 
async deleteMultipleBlock(@Body("ids") idArray: number[]): Promise<ResponseModel> {
     
  return this.blockService.deleteMultipleBlocks(idArray);
}

@Get('get-block-details-:id')
getBlockDetails(@Param('id', ParseIntPipe) id: number) {
  return this.blockService.getBlockDetails(id);
}

}

