// new
import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service'; // Ensure this import path is correct
import { CreateNewBlockDto } from './create-new-block.dto';
import { ResponseModel } from 'src/shared/models/response.model';
import { errorResponse, successResponse } from 'src/shared/helpers/functions';

@Injectable()
export class BlockService {
  constructor(private readonly prisma: PrismaService) {}  

  async createNewBlock(payload: CreateNewBlockDto): Promise<ResponseModel> {
    
    const block = await this.prisma.block.create({
      data: {
        blockno: payload.blockno, 
      }
    });
    return successResponse(
        'Block Created Successfully',
        block,
      );
  }

  async getAllBlocks(): Promise<ResponseModel> {
    const blocks = await this.prisma.block.findMany();
    return successResponse('Fetched all blocks successfully', blocks);
  }


async updateBlock(id: string, payload: CreateNewBlockDto): Promise<ResponseModel> {
    try {
      const blockId = parseInt(id); // Convert the string id to a number
  
      // Check if the conversion was successful
      if (isNaN(blockId)) {
        throw new Error('Invalid ID format. ID must be a number.');
      }
  
      const updatedBlock = await this.prisma.block.update({
        where: { id: blockId }, // Use the converted blockId here
        data: {
          blockno: payload.blockno,
        },
      });
      return successResponse('Block updated successfully', updatedBlock);
    } catch (error) {
      return errorResponse('Error updating block', error.message);
    }
  }
  


async deleteBlock(id: string): Promise<ResponseModel> {
    try {
        const blockId = parseInt(id); // Convert the string ID to a number

        // Check if the conversion was successful
        if (isNaN(blockId)) {
            throw new Error('Invalid ID format. ID must be a number.');
        }

        await this.prisma.block.delete({
            where: { id: blockId }, // Use the converted blockId
        });
        const allBlock = await this.prisma.block.findMany();
        return successResponse('Block deleted successfully', allBlock);
    } catch (error) {
        return errorResponse('Error deleting block', error.message);
    }
}

async deleteMultipleBlocks(idArray: number[]): Promise<ResponseModel> {
    try {
      console.log("herehere",idArray);
    //   const blockIds = idArray.map(id => {
    //     const blockId = parseInt(id); 
    //     if (isNaN(blockId)) {
    //       throw new Error(`Invalid ID format: ${id}. ID must be a number.`);
    //     }
    //     return blockId;
    //   });
  
      const deletePromises = idArray.map(blockId => 
        this.prisma.block.delete({ where: { id: blockId } }) // Use blockId for deletion
      );
  
      await Promise.all(deletePromises);
      return successResponse('Blocks deleted successfully', null);
    } catch (error) {
      return errorResponse('Error deleting blocks', error.message);
    }
  }
  
  async getBlockDetails(id: number) {
    try {
      const result = await this.prisma.block.findFirst({
        where: {
          id: id,
        },
      });
      if (!result) {
        return errorResponse('Invalid Request!');
      }

      return successResponse('Block details', result);
    } catch (error) {
      //processException(error);
    }
  }
}
