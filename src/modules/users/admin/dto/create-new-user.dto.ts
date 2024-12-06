import {
  IsIn,
  IsNotEmpty,
  IsEmpty,
  IsNumber,
  IsOptional,
  IsString,
  Matches,
  MinLength,
} from 'class-validator';
import {
  GenderTypeArray,
  StatusOnOffArray,
} from 'src/shared/constants/array.constants';

// export class CreateNewUserDto {

  
//   @IsNotEmpty()
//   @IsString()
//   fullName: string;

//   @IsNotEmpty()
//   @IsString()
//   fatherName: string;
  
//   @IsNotEmpty()
//   @IsNumber()
//   gender: number;

//   @IsNotEmpty()
//   @IsString()
//   mobileNo: string;

//   @IsNotEmpty()
//   @IsString()
//   address: string;

//   @IsNotEmpty()
//   @IsNumber()
//   blockId: number;

//   @IsNotEmpty()
//   @IsNumber()
//   schoolId: number;

//   @IsNotEmpty()
//   @IsNumber()
//   examId: number;
  
//   @IsNotEmpty()
//   @IsNumber()
//   status: number;

//   @IsNotEmpty()
//   @IsString()
//   roles: string;

//   @IsNotEmpty()
//   @IsString()
//   dob: string;

//   // @IsNotEmpty()
//   // @IsString()
//   // email: string;

 

  
// }

export class CreateNewUserDto {

  @IsNotEmpty()
  @IsString()
  fullName: string;

  @IsNotEmpty()
  @IsString()
  fatherName: string;

  @IsOptional()
  @IsString()
  first_name: string;

  @IsOptional()
  @IsString()
  last_name: string;
 
  @IsNotEmpty()
  @IsString()
  phone: string;

  @IsOptional()
  @IsString()
  nick_name: string;
 
  @IsOptional()
  @IsNumber()
  file_id: number;

  @IsNotEmpty()
  @IsString()
  country: string;

  @IsOptional()
  @IsString()
  birth_date: string;

  @IsNotEmpty()
  @IsNumber()
  @IsIn(GenderTypeArray)
  gender: number;

  @IsNotEmpty()
  @IsNumber()
  blockId: number;

  @IsNotEmpty()
  @IsNumber()
  schoolId: number;

  @IsNotEmpty()
  @IsNumber()
  examId: number;

  @IsNotEmpty()
  @IsString()
  address: string;

  @IsNotEmpty()
  @IsNumber()
  @IsIn(StatusOnOffArray)
  status: number;

  @IsNotEmpty()
  @IsString()
  roles: string;

  @IsOptional()
  @IsString()
  email: string;

  @IsNotEmpty()
  @IsString()
  otp: string;
  
  @IsOptional()
  @IsString()
  // @MinLength(8, { message: 'Password must have length of at least 8' })
  // @Matches(/((?=.*\d)|(?=.*\W+))(?![.\n])(?=.*[a-z]).*$/, {
  //   message: 'Password must contain at least 1 number and 1 letter',
  // })
  password: string;
}
