Frontend_System Frontend;
PImage BackGround;
int state=0;

void setup() {
  fullScreen();
  frameRate(60);
  Frontend = new Frontend_System();
  BackGround = loadImage("BackGround.png");
}

void draw() {
  background(255);
  image(BackGround,0,0);
  switch(state) {
  case 0:
    Frontend.Start();
    break;
  case 1:
    Frontend.SetupVertical();
    if (Frontend.go_next==true) {
      state++; 
      Frontend.go_next=false;
    }
    break;
  case 2:
    Frontend.SetupHorizontal();
    if (Frontend.go_next==true) {
      state++; 
      Frontend.go_next=false;
    }
    break;
  case 3:
    Frontend.Exicute();
    if (Frontend.go_next==true) {
      state=5; 
      Frontend.go_next=false;
    }
    break;
  case 5:
    Frontend.Roulette();
    if (Frontend.go_next==true) {
      state++; 
      Frontend.go_next=false;
    }
    break;
  case 6:
    Frontend.Result();
    break;
  }
}

void keyPressed() {
  switch(keyCode) {
  case 'P':
    if (state==5) {
      Frontend.OffRoulette();
    }    
    break;
  case 'S':
    if (state==5) {
      Frontend.OnRoulette();
    }
    break;
  case ENTER:
    if (state==0) {
      state=1;
    }
    if (state==1||state==2||state==3) {
      Frontend.NumberEnteringFinished();
    }
    if (state==6) {
      state=0;
    }
    break;
  case '0':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(0);
    }
    break;
  case '1':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(1);
    }
    break;
  case '2':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(2);
    }
    break;
  case '3':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(3);
    }
    break;
  case '4':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(4);
    }
    break;
  case '5':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(5);
    }
    break;
  case '6':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(6);
    }
    break;
  case '7':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(7);
    }
    break;
  case '8':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(8);
    }
    break;
  case '9':
    if (state==1||state==2||state==3) {
      Frontend.NumberEntering(9);
    }
    break;
  case BACKSPACE:
    if (state==1||state==2||state==3) {
      Frontend.NumberDelete();
    }
    break;
  case ESC:
    exit();
    break;
  }
}
