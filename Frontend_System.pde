class Frontend_System {
  int for_tmp, for_tmp1, for_tmp2;
  int seat_num, current_num, seats_vertical, seats_horizontal;
  boolean go_next=false;

  int text_size=100, title_size=200, frame=0;

  int total_num=0;
  boolean num_enter=true;

  int room_size=800, room_start=100, seats_vertical_lengh, seats_horizontal_lengh;

  int seat_x, seat_y;

  int max = 10000;
  int[] seats=new int[max];
  boolean on_off_bool;

  Frontend_System() {
  }

  void Start() {
    textSize(title_size);
    fill(0, 206, 209);
    text("Change Seat", width/2-title_size*4, height*0.35);
    textSize(text_size);
    fill(0, 206, 209);
    text("Press Enter to Start", width/2-text_size, height*0.75);
    seat_num = 0;
    current_num = 0;
    frame=0;
    num_enter=true;
    room_size=800;
    on_off_bool = true;
    for (for_tmp=0; for_tmp<max; for_tmp++) {
      seats[for_tmp]=0;
    }
  }

  void SetupVertical() {
    textSize(text_size);
    fill(0, 206, 209);
    text("Enter the virtical lengh of the seats", width*.1, height*0.35, 1000, 500);
    textSize(text_size*1.5);
    text(total_num, width*.7, height*0.55);
    if (num_enter==false) {
      seats_vertical=total_num;
      total_num=0;
      num_enter=true;
      go_next=true;
      frame=0;
    }
    frame++;
  }

  void SetupHorizontal() {
    textSize(text_size);
    fill(0, 206, 209);
    text("Enter the horizontal lengh of the seats", width*.1, height*0.35, 1000, 500);
    textSize(text_size*1.5);
    text(total_num, width*.7, height*0.55);
    if (num_enter==false) {
      seats_horizontal=total_num;
      total_num=0;
      num_enter=true;
      go_next=true;
      frame=0;
      seat_num=seats_horizontal*seats_vertical;
    }
    frame++;
  }

  void NumberEntering(int entered_num) {
    total_num = total_num*10+entered_num;
  }

  void NumberEnteringFinished() {
    if (frame>20) {
      num_enter=false;
    }
  }

  void NumberDelete() {
    total_num = total_num/10;
  }

  void Exicute() {
    if (seats_vertical==0) {
      seats_vertical=1;
    }
    if (seats_horizontal==0) {
      seats_horizontal=1;
    }
    seats_vertical_lengh=room_size/seats_vertical;
    seats_horizontal_lengh=room_size/seats_horizontal;
    stroke(200);
    strokeWeight(3);
    for (for_tmp=0; for_tmp<seats_vertical; for_tmp++) {
      for (for_tmp1=0; for_tmp1<seats_horizontal; for_tmp1++) {
        if (seats[(for_tmp)+(for_tmp1)*seats_vertical]==1) {
          fill(40);
        } else {
          fill(240,255,245);
        }
        rect(room_start+seats_horizontal_lengh*for_tmp1, room_start+seats_vertical_lengh*for_tmp, seats_horizontal_lengh, seats_vertical_lengh);
      }
    }
    textSize(text_size*.8);
    fill(0, 206, 209);
    text("Enter the seats you want to exicute.Vertical row on 10x horizon on 1x", width*0.5, height*0.2, 900, 700);
    textSize(text_size*1.5);
    text(total_num, width*.75, height*0.75);
    while (num_enter==false) {
      if (total_num==0) {
        go_next=true;
        break;
      }
      for_tmp=total_num/10;
      for_tmp1=total_num%10;
      seats[(for_tmp-1)+(for_tmp1-1)*seats_horizontal]=1;
      num_enter=true;
      frame=0;      
      total_num=0;
    }
    frame++;
  }

  void Roulette() {

    if (on_off_bool==true&&frame%(int(random(4))+1)==0) {
      current_num = int(random(seat_num))+1;
      while (true) {
        if (seats[current_num-1]==0) {
          break;
        }
        current_num = int(random(seat_num))+1;
      }
    }

    room_size=700;
    seats_vertical_lengh=room_size/seats_vertical;
    room_size=1000;
    seats_horizontal_lengh=room_size/seats_horizontal;
    for (for_tmp=0; for_tmp<seats_vertical; for_tmp++) {
      for (for_tmp1=0; for_tmp1<seats_horizontal; for_tmp1++) {
        if (seats[(for_tmp)+(for_tmp1)*seats_vertical]==1) {
          fill(40);
        } else if (seats[(for_tmp)+(for_tmp1)*seats_vertical]==2) {
          fill(0, 250, 154);
        } else {
          fill(240,255,245);
        }
        rect(460+seats_horizontal_lengh*for_tmp1, 100+seats_vertical_lengh*for_tmp, seats_horizontal_lengh, seats_vertical_lengh);
      }
    }

    frame++;

    for_tmp1=(current_num-1)/seats_vertical;
    for_tmp=(current_num-1)%seats_vertical;
    fill(255, 192, 203);
    rect(460+seats_horizontal_lengh*for_tmp1, 100+seats_vertical_lengh*for_tmp, seats_horizontal_lengh, seats_vertical_lengh);

    for (for_tmp=0; for_tmp<seats_vertical; for_tmp++) {
      for (for_tmp1=0; for_tmp1<seats_horizontal; for_tmp1++) {
        if (seats[(for_tmp)+(for_tmp1)*seats_vertical]>=1) {
          for_tmp2++;
        }
      }
    }
    if (for_tmp2==seats_horizontal*seats_vertical) {
      go_next=true;
      frame=0;
    }
    for_tmp2=0;

    textSize(text_size);
    fill(0, 206, 209);
    text("Press 'S' to start, 'P' to stop", 300, height*.9);
  }

  void OnRoulette() {
    on_off_bool = true;
  }

  void OffRoulette() {
    on_off_bool = false;
    seats[current_num-1] = 2;
  }

  void Result() {
    for (for_tmp=0; for_tmp<seats_vertical; for_tmp++) {
      for (for_tmp1=0; for_tmp1<seats_horizontal; for_tmp1++) {
        if (seats[(for_tmp)+(for_tmp1)*seats_vertical]==1) {
          fill(40);
        } else if (seats[(for_tmp)+(for_tmp1)*seats_vertical]==2) {
          fill(0, 250, 154);
        } else {
          fill(240,255,245);
        }
        rect(460+seats_horizontal_lengh*for_tmp1, 100+seats_vertical_lengh*for_tmp, seats_horizontal_lengh, seats_vertical_lengh);
      }
    }
    textSize(text_size);
    fill(0, 206, 209);
    text("Press Enter to restart", 460, height*.9);
  }
}
