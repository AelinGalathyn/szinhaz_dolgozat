import { Body, Controller, Get, Redirect, Render, Res, Post } from '@nestjs/common';
import * as mysql from 'mysql2';
import { AppService } from './app.service';
import { UjKuponDto } from './UjKuponDto';

const conn = mysql.createPool({
  host: process.env.DB_HOST || 'localhost',
  port: parseInt(process.env.DB_PORT) || 3306,
  user: process.env.DB_USERNAME || 'root',
  password: process.env.DB_PASSWORD || '',
  database: process.env.DB_DATABASE || '14s_ismetles',
}).promise();

@Controller()
export class AppController {
  constructor(private readonly appService: AppService) { }

  @Get()
  @Render('index')
  async index() {
    const [adatok, mezok] = await conn.execute('SELECT id, title, percentage, code FROM kuponok ORDER BY title');

    console.log(adatok);

    return {
      kuponok: adatok,
    };
  }

  @Get('/newCoupon')
  @Render('newCoupon')
  newCouponForm() {
    return{
      errorM: "",
    }
  }

  @Post('/newCoupon')
  @Redirect('/')
  async newCoupon(@Body() ujKupon: UjKuponDto, @Res() res) {
    console.log('Received data:', ujKupon);
    const title = ujKupon.title;
    const percentage = ujKupon.percentage;
    const code = ujKupon.code;

    if (title.length >= 1 || percentage >= 1 || percentage <= 99) {
      const regex = /^[A-Za-z]{4}-[0-9]{6}$/g;
      if (regex.test(code)) {
        const [adatok] = await conn.execute(
          'INSERT INTO kuponok (title, percentage, code) VALUES (?, ?, ?)', [title, percentage, code]
        );

        return { ujKupon };
      }else {
        res.send('<script>alert("Hibás adatok!"); window.location.href = "/newCoupon";</script>');
      }
    } else {
      res.send('<script>alert("Hibás adatok!"); window.location.href = "/newCoupon";</script>');
    }
  }
}
