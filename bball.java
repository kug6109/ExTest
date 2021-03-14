import java.applet.*; 

import java.awt.*; 

import java.awt.event.*; 

class MyPanel extends Panel implements Runnable 

{ 

    int x = 10, y = 10; 

    int x_shift = 4, y_shift = 5; 

    Button btn_stop = new Button("stop"); 

    Button btn_start = new Button("start"); 
    
    Button btn_random = new Button("random"); 

    Thread thread; 

    public MyPanel() 

    { 

       // TODO Auto-generated constructor stub 

       x_shift = (int) (Math.random() * 10 + 1); 

       y_shift = (int) (Math.random() * 10 + 1); 

       this.add(btn_stop); 

       this.add(btn_start); 
       
       this.add(btn_random);

       btn_stop.addActionListener(new ActionListener() 

       { 

          @Override 

          public void actionPerformed(ActionEvent e) 

          { 

             // TODO Auto-generated method stub 

             thread.suspend();//스레드 멈춤 suspend

          } 

       }); 

       btn_start.addActionListener(new ActionListener() 

       { 

          @Override 

          public void actionPerformed(ActionEvent e) 

          { 

             // TODO Auto-generated method stub 

             thread.resume();//스레드 다시 실행 

          } 
          
       });
       
       btn_random.addActionListener(new ActionListener() 

       { 

          @Override 

          public void actionPerformed(ActionEvent e) 

          { 

             // TODO Auto-generated method stub 

        	  x_shift = (int) (Math.random() * 10 + 1); 

              y_shift = (int) (Math.random() * 10 + 1);

          }
       }); 

       thread = new Thread(this); 

       thread.start(); 

    } 

    @Override 

    public void run() 

    { 

       // TODO Auto-generated method stub 

       while (true) 

       { 

          x = x + x_shift; 

          y = y + y_shift;// 원 움직이기 

          if (x < 10 || x > 490 - 30)// 원이 선을 벗어나면 

          { 

             x_shift *= -1;// 반대 방향으로 움직이기 

             if (x < 10) 

             x = 30;// 위치 보정 

             if (x > 490 - 10) 

             x = 490 - 10; 

          } 

          if (y < 10 || y > 490 - 30) 

          { 

             y_shift *= -1; 

             if (y < 10) 

             y = 30; 
             if (y > 490 - 10) 

             y = 490 - 10; 

          } 

          repaint();// 화면 갱신 

          try 

          { 

             Thread.sleep(10); 

          } catch (InterruptedException ex) 

          { 

          } 

       } 

    } 

    public void paint(Graphics g) 

    { 

       Image img = createImage(getWidth(), getHeight()); 
       Graphics bg = img.getGraphics();// 백버퍼 만들기 

       bg.drawLine(10, 10, 490, 10); 

       bg.drawLine(490, 10, 490, 490); 

       bg.drawLine(10, 490, 490, 490); 

       bg.drawLine(10, 10, 10, 490);// 백버퍼에 선 그리기 

       bg.setColor(Color.blue); 

       bg.fillOval(x, y, 30, 30);// 백버퍼에 원그리기 

       g.drawImage(img, 0, 0, this);// 백버퍼를 보이게 

    } 

    @Override 

    public void update(Graphics g) 

    { 

       // TODO Auto-generated method stub 

       paint(g); 

    } 

 } 

 public class bball extends Applet 

 { 

    MyPanel panel1; 

    @Override 

    public void init() 

    { 

       // TODO Auto-generated method stub 

       this.setLayout(new GridLayout(0, 1));//레이아웃 변경 

       panel1 = new MyPanel(); 

       this.add(panel1); 

       this.setVisible(true); 

       this.setSize(500, 500); 

    } 

 } 

