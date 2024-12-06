import { IsNotEmpty, IsNumber, IsOptional, IsString } from 'class-validator';

export class UpdateLandingPageDataDto {
  @IsOptional()
  @IsString()
  landing_main_banner_main_title: string;

  @IsNotEmpty()
  @IsString()
  landing_main_banner_first_title: string;

  @IsOptional()
  @IsString()
  landing_main_banner_second_title: string;

  @IsNotEmpty()
  @IsString()
  landing_main_banner_first_description: string;

  @IsOptional()
  @IsNumber()
  landing_main_banner_image_url: number;
}
