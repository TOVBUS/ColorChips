/*
import { Controller, Get, UseGuards, Req, Res } from '@nestjs/common';
import { AuthGuard } from '@nestjs/passport';
import { AuthService } from './auth.service';

@Controller('auth')
export class AuthController {
  constructor(private authService: AuthService) {}

  @Get('apple')
  @UseGuards(AuthGuard('apple'))
  async appleAuth(@Req() req) {}

  @Get('apple/callback')
  @UseGuards(AuthGuard('apple'))
  async appleAuthRedirect(@Req() req, @Res() res) {
    const { appleId } = req.user;
    const member = await this.authService.validateAppleUser(appleId, req.user);
    // Here you would typically create a session or JWT for the user
    res.redirect('/some-frontend-url');
  }
}
*/
