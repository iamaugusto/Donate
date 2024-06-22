import { Routes } from '@angular/router';
import { SignInComponent } from './views/account/sign-in/sign-in.component';
import { SignUpComponent } from './views/account/sign-up/sign-up.component';
import { HomeComponent } from './views/app/home/home.component';
import { ChatComponent } from './views/functions/chat/chat.component';
import { AdsComponent } from './views/functions/ads/ads.component.spec';
import { DonationComponent } from './views/functions/donation/donation.component';
import { MainComponent } from './views/main/main.component';




export const routes: Routes = [

    {
        path: 'account/sign-in',
        component: SignInComponent,
    },
    {
        path: 'account/sign-up',
        component: SignUpComponent,
    },
    {
        path: 'home',
        component: HomeComponent,
    },
    {
        path: 'chat',
        component: ChatComponent,
    },
    {
        path: 'ads',
        component: AdsComponent,
    },
    {
        path: 'donation',
        component: DonationComponent,
    },
    {
        path: '**',
        component: MainComponent,
    },
    

    

];
