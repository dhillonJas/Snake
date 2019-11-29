enum Direction { //<>//
  right, left, up, down
};
void setup()
{
  size(720, 720);
  background(0);
  frameRate(10);
}
int SPEED = 20;
Snake snake = new Snake();
Fruit fruit = new Fruit();
boolean game = true;
void draw()
{
  clear();
  snake.show();
  if (game) 
    snake.move();
  fruit.show();
  snake.eat();
}

void keyPressed()
{
  switch (key)
  {
  case 'd':
    snake.setDirection(Direction.right);
    break;
  case 'a':
    snake.setDirection(Direction.left);
    break;
  case 'w':
    snake.setDirection(Direction.up);
    break;
  case 's':
    snake.setDirection(Direction.down);
    break;
  case 'r':
    snake = new Snake();
    fruit = new Fruit();
    game = true;
    break;
  };
}
