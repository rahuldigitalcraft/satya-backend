import {
    IsNotEmpty,
    IsString,
  } from 'class-validator';

export class CreateNewBlockDto {
    @IsNotEmpty()
    @IsString()
    blockno: string;

  }