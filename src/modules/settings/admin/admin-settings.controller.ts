import { Body, Controller, Get, Post } from '@nestjs/common';
import { SettingsService } from '../settings.service';
import { updateSMTPSettingsDto } from './dto/update-smtp-settings.dt';
import { ResponseModel } from 'src/shared/models/response.model';
import { IsAdmin } from 'src/shared/decorators/is-admin.decorator';
import { UpdateTermsPrivacyDto } from './dto/update-terms-privacy.dt';
import { UpdateGeneralSettingsDto } from './dto/update-general-settings.dto';
import { UpdateGoogleAuthSettingsDto } from './dto/update-google-auth-settings.dto';
import { UpdateGithubAuthSettingsDto } from './dto/update-github-auth-settings.dto';
import { UpdateLandingPageDataDto } from './dto/update-landing-page-data.dto';
import { UpdateLandingAboutSectionDataDto } from './dto/update-landing-about-section-data.dto';
import { UpdateLandingChooseUsSectionDataDto } from './dto/update-landing-choose-us-section-data.dto';
import { UpdateLandingHowItWorkSectionDataDto } from './dto/update-landing-how-it-work-data.dto';
import { UpdateBusinessSettingsDto } from './dto/update-business-settings.dto';
import { UpdateAgoraCredentialsDto } from './dto/update-agora-credentials.dto';

@IsAdmin()
@Controller('admin')
export class AdminSettingsController {
  constructor(private readonly settingsService: SettingsService) {}

  @Post('update-smtp-settings')
  updateSMTPSettings(
    @Body() payload: updateSMTPSettingsDto,
  ): Promise<ResponseModel> {
    return this.settingsService.updateSMTPSettings(payload);
  }

  @Get('get-smtp-settings-data')
  getSmtpSettingsData(): Promise<ResponseModel> {
    return this.settingsService.getSmtpSettingsData();
  }

  @Post('send-test-mail')
  sendTestMail(@Body() payload: { email: string }) {
    return this.settingsService.sendTestMail(payload);
  }

  @Post('update-terms-privacy')
  updateTermsPrivacy(
    @Body() payload: UpdateTermsPrivacyDto,
  ): Promise<ResponseModel> {
    return this.settingsService.updateTermsPrivacy(payload);
  }

  @Get('get-terms-privacy-data')
  getTermsPrivacyData(): Promise<ResponseModel> {
    return this.settingsService.getTermsPrivacyData();
  }

  @Post('update-general-settings')
  updateGeneralSettings(
    @Body() payload: UpdateGeneralSettingsDto,
  ): Promise<ResponseModel> {
    return this.settingsService.updateGeneralSettings(payload);
  }

  @Get('general-settings-data')
  getGeneralSettingsData(): Promise<ResponseModel> {
    return this.settingsService.getGeneralSettingsData();
  }

  @Post('update-google-auth-settings')
  updateGoogleAuthSettings(@Body() payload: UpdateGoogleAuthSettingsDto) {
    return this.settingsService.updateGoogleAuthSettings(payload);
  }

  @Get('get-google-auth-settings-data')
  getGoogleAuthSettingsData() {
    return this.settingsService.getGoogleAuthSettingsData();
  }

  @Post('update-github-auth-settings')
  updateGithubAuthSettings(@Body() payload: UpdateGithubAuthSettingsDto) {
    return this.settingsService.updateGithubAuthSettings(payload);
  }

  @Get('get-github-auth-settings-data')
  getGithubAuthSettingsData() {
    return this.settingsService.getGithubAuthSettingsData();
  }

  @Post('update-landing-main-banner-data')
  updateLandingMainBannerData(@Body() payload: UpdateLandingPageDataDto) {
    return this.settingsService.updateLandingMainBannerData(payload);
  }

  @Post('update-landing-srtst-main-banner-data')
  updateLandingSrtstMainBannerData(@Body() payload: any) {
    return this.settingsService.updateLandingSrtstMainBannerData(payload);
  }

  @Get('get-landing-main-banner-data')
  getLandingMainBannerData() {
    return this.settingsService.getLandingMainBannerData();
  }

  @Post('update-landing-about-section-data')
  updateLandingAboutSectionData(
    @Body() payload: UpdateLandingAboutSectionDataDto,
  ) {
    return this.settingsService.updateLandingAboutSectionData(payload);
  }

  @Post('update-landing-srtst-about-section-data')
  updateLandingSrtstAboutSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingSrtstAboutSectionData(payload);
  }

  @Post('update-landing-srtst-benefit-section-data')
  updateLandingSrtstBenefitSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingSrtstBenefitSectionData(payload);
  }


  @Post('update-landing-srtst-syllabus-section-data')
  updateLandingSrtstSyllabusSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingSrtstSyllabusSectionData(payload);
  }


  
  

  @Get('get-landing-about-section-data')
  getLandingAboutSectionData() {
    return this.settingsService.getLandingAboutSectionData();
  }
  @Get('get-landing-srtst-about-section-data')
  getLandingSrtstAboutSectionData() {
    return this.settingsService.getLandingSrtstAboutSectionData();
  }

  @Get('get-landing-srtst-benefit-section-data')
  getLandingSrtstBenefitSectionData() {
    return this.settingsService.getLandingSrtstBenefitSectionData();
  }

  @Get('get-landing-srtst-syllabus-section-data')
  getLandingSrtstSyllabusSectionData() {
    return this.settingsService.getLandingSrtstSyllabusSectionData();
  }

  @Get('get-landing-srtst-success-section-data')
  getLandingSrtstSuccessSectionData() {
    return this.settingsService.getLandingSrtstSuccessSectionData();
  }
  
  

  

  @Post('update-landing-choose-us-section-data')
  updateLandingChooseUsSectionData(
    @Body() payload: UpdateLandingChooseUsSectionDataDto,
  ) {
    return this.settingsService.updateLandingChooseUsSectionData(payload);
  }


  @Get('get-landing-achievement-section-data')
  getLandingAchievementSectionData() {
    return this.settingsService.getLandingAchievementSectionData();
  }
 
  @Get('get-landing-mostpoularcourse-section-data')
  getLandingMostPopularCourseSectionData() {
    return this.settingsService.getLandingMostPopularCourseSectionData();
  }

  @Get('get-landing-programme-section-data')
  getLandingProgrammeSectionData() {
    return this.settingsService.getLandingProgrammeSectionData();
  }

  

  @Get('get-landing-contact-us-section-data')
  getLandingContactUsSectionData() {
    return this.settingsService.getLandingContactUsSectionData();
  }

  @Post('update-landing-achievement-section-data')
  updateLandingAchievementSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingAchievementSectionData(payload);
  }

  @Post('update-landing-programme-section-data')
  updateLandingProgrammeSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingProgrammeSectionData(payload);
  }

  @Post('update-contact-us-section-data')
  updateContactUsSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateContactUsSectionData(payload);
  }


  @Post('update-landing-most-popular-course-section-data')
  updateLandingMostPopularCourseSectionData(
    @Body() payload: any,
  ) {
    return this.settingsService.updateLandingMostPopularCourseSectionData(payload);
  }

  @Get('get-landing-choose-us-section-data')
  getLandingChooseUsSectionData() {
    return this.settingsService.getLandingChooseUsSectionData();
  }

  @Post('update-landing-how-it-work-data')
  updateLandingHowItWorkSectionData(
    @Body() payload: UpdateLandingHowItWorkSectionDataDto,
  ) {
    return this.settingsService.updateLandingHowItWorkSectionData(payload);
  }

  @Get('get-landing-how-it-work-data')
  getLandingHowItWorkSectionData() {
    return this.settingsService.getLandingHowItWorkSectionData();
  }

  @Post('update-business-settings')
  updateBusinessSettings(@Body() payload: UpdateBusinessSettingsDto) {
    return this.settingsService.updateBusinessSettings(payload);
  }

  @Get('get-business-settings-data')
  getBusinessSettingsData() {
    return this.settingsService.getBusinessSettingsData();
  }

  @Post('update-agora-settings')
  updateAgoraCredentials(@Body() payload:UpdateAgoraCredentialsDto){
    return this.settingsService.updateAgoraCredentials(payload);
  }

  @Get('get-agora-settings-data')
  getAgoraSettingsData() {
    return this.settingsService.getAgoraSettingsData();
  }
  
}
