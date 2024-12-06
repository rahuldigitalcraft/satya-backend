import {
    IsNotEmpty,
    IsString,
  } from 'class-validator';

export class CreateNewSchoolDto {
    @IsNotEmpty()
    @IsString()
    name: string;

  }