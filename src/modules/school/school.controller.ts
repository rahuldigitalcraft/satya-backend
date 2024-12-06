import { SchoolService } from "./school.service";
import {
  Body,
  Controller,
  Get,
  Post,
  Put,
  Delete,
  Param,
  ParseIntPipe
} from "@nestjs/common";
import { CreateNewSchoolDto } from "./create-new-school.dto";
import { ResponseModel } from "src/shared/models/response.model";

@Controller("school")
export class SchoolController {
  constructor(private readonly schoolService: SchoolService) {}

  @Post("store")
  createNewSchool(@Body() payload: any) {
    return this.schoolService.createNewSchool(payload);
  }

  @Get("/")
  async getAllSchools() {
    return this.schoolService.getAllSchools();
  }

  @Put(":id")
  async updateSchool(
    @Param("id") id: string,
    @Body() payload: CreateNewSchoolDto
  ): Promise<ResponseModel> {
    return this.schoolService.updateSchool(id, payload);
  }

  @Delete(":id")
  async deleteSchool(@Param("id") id: string): Promise<ResponseModel> {
    return this.schoolService.deleteBlock(id);
  }

  @Post("delete-all")
  async deleteMultipleSchool(
    @Body("ids") idArray: number[]
  ): Promise<ResponseModel> {
    return this.schoolService.deleteMultipleBlocks(idArray);
  }


  @Get('get-school-details-:id')
    getSchoolDetails(@Param('id', ParseIntPipe) id: number) {
      return this.schoolService.getSchoolDetails(id);
    }
}
