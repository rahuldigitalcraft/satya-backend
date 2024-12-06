import { Injectable } from '@nestjs/common';
import { PrismaService } from '../prisma/prisma.service'; // Ensure this import path is correct
import { CreateNewSchoolDto } from './create-new-school.dto';
import { ResponseModel } from 'src/shared/models/response.model';
import { errorResponse, successResponse } from 'src/shared/helpers/functions';

@Injectable()
export class SchoolService {
  constructor(private readonly prisma: PrismaService) {}  

  async createNewSchool(payload: CreateNewSchoolDto): Promise<ResponseModel> {
    
    const school = await this.prisma.school.create({
      data: {
        name: payload.name, 
      }
    });
    return successResponse(
        'School Created Successfully',
        school,
       );
  }

//   async getAllSchools(): Promise<ResponseModel> {
//     const schools = await this.prisma.school.findMany();
//     return successResponse('Fetched all schools successfully', schools);
//   }

async getAllSchools(): Promise<ResponseModel> {
 const schools = await this.prisma.school.findMany();
 return successResponse('Fetched all schools successfully', schools);
}


async updateSchool(id: string, payload: CreateNewSchoolDto): Promise<ResponseModel> {
    try {
      const schoolId = parseInt(id);
      if (isNaN(schoolId)) {
        throw new Error('Invalid ID format. ID must be a number.');
      }
  
      const updatedSchool = await this.prisma.school.update({
        where: { id: schoolId }, 
        data: {
          name: payload.name,
        },
      });
      return successResponse('School updated successfully', updatedSchool);
    } catch (error) {
      return errorResponse('Error updating School', error.message);
    }
  }
  
async deleteBlock(id: string): Promise<ResponseModel> {
    try {
        const blockId = parseInt(id); // Convert the string ID to a number

        // Check if the conversion was successful
        if (isNaN(blockId)) {
            throw new Error('Invalid ID format. ID must be a number.');
        }

        await this.prisma.school.delete({
            where: { id: blockId }, // Use the converted blockId
        });
        return successResponse('School deleted successfully', null);
    } catch (error) {
        return errorResponse('Error deleting school', error.message);
    }
}

async deleteMultipleBlocks(idArray: number[]): Promise<ResponseModel> {
  try {
      const blockIds = (idArray as unknown as string[]).map(id => {
          const blockId = parseInt(id); 
          if (isNaN(blockId)) {
              throw new Error(`Invalid ID format: ${id}. ID must be a number.`);
          }
          return blockIds;
      });

    const deletePromises = idArray.map(blockId => 
      this.prisma.school.delete({ where: { id: blockId } }) // Use blockId for deletion
    );

    await Promise.all(deletePromises);
    return successResponse('Blocks deleted successfully', null);
  } catch (error) {
    return errorResponse('Error deleting schools', error.message);
  }
}

async getSchoolDetails(id: number) {
    try {
      const result = await this.prisma.school.findFirst({
        where: {
          id: id,
        },
      });
      if (!result) {
        return errorResponse('Invalid Request!');
      }

      return successResponse('School details', result);
    } catch (error) {
      //processException(error);
    }
  }
  
}
