class Snake
{
  private ArrayList<Square> squares;
  private Square head;

  public Snake()
  {
    squares = new ArrayList<Square>();
    squares.add(new Square(new PVector(SPEED + 40, SPEED), Direction.right, Direction.right));
    squares.add(new Square(new PVector(SPEED + 20, SPEED), Direction.right, Direction.right));
    squares.add(new Square(new PVector(SPEED, SPEED), Direction.right, Direction.right));
    head = squares.get(0);
    head.direction = Direction.right;
  }

  public void setDirection(Direction d)
  {
    head.prevDir = head.direction;
    head.direction = d;
  }

  public void show()
  {
    for (Square s : squares)
      s.show();
  }

  public void move()
  {
    for (int i = squares.size()-1; i >= 0; i--)
    {
      if (i > 0) 
        squares.get(i).setDirection(squares.get(i-1).prevDir);
      squares.get(i).setPrevDir(squares.get(i).direction);
      squares.get(i).move();
      if (i == 0 && overlap((int)head.position.x, (int)head.position.y) || head.position.x < 0 || head.position.x > width-20 || head.position.y < 0 || head.position.y > height-20)
        game = false;
    }
  }

  public void eat()
  {
    int x, y;
    if (head.position.equals(fruit.position))
    {
      x = (int)fruit.position.x;
      y = (int)fruit.position.y;
      switch (head.direction)
      {
      case right:
        x += 20;
        break;
      case left:
        x -= 20;
        break;
      case up:
        y -= 20;
        break;
      case down:
        y += 20;
        break;
      }

      Square s = new Square(new PVector(x, y), head.direction, head.direction);
      squares.add(0, s);
      head = s;
      fruit.addFruit();
    }
  }

  private boolean overlap(int x, int y)
  {
    for (int i = 1; i < snake.squares.size(); i++)
    {
      if (squares.get(i).position.x == x && squares.get(i).position.y == y)
        return true;
    }
    return false;
  }
}
class Square
{
  private PVector position;
  private Direction direction;
  private Direction prevDir;

  public Square(PVector pos, Direction d, Direction pd)
  {
    position = pos;
    direction = d;
    prevDir = pd;
  }

  public void show()
  {
    rect(position.x, position.y, 20, 20);
  }

  public void move()
  {
    switch (direction)
    {
    case right:
      moveRight();
      break;
    case left:
      moveLeft();
      break;
    case up:
      moveUp();
      break;
    case down:
      moveDown();
      break;
    };
  }

  private void moveRight()
  {
    position.x += SPEED;
  }

  private void moveLeft()
  {
    position.x -= SPEED;
  }

  private void moveUp()
  {
    position.y -= SPEED;
  }

  private void moveDown()
  {
    position.y += SPEED;
  }

  public void setDirection(Direction d)
  {
    direction = d;
  }

  public void setPrevDir(Direction d)
  {
    prevDir = d;
  }
}
