class Fruit
{
  private PVector position;

  public Fruit()
  {
    position = new PVector();
    addFruit();
  }

  public void addFruit()
  {
    int x, y;
    do
    {
      x = (int)random(width);
      y = (int)random(height);
    }
    while (!overlap(x, y) && (x % SPEED != 0 || y % SPEED != 0));

    position.x = x;
    position.y = y;
  }

  public void show()
  {
    fill(255, 0, 0);
    rect(position.x, position.y, 20, 20);
    fill(255);
  }

  private boolean overlap(int x, int y)
  {
    for (int i = 0; i < snake.squares.size(); i++)
    {
      if (snake.squares.get(i).position.x == x && snake.squares.get(i).position.y == y)
        return true;
    }
    return false;
  }
}
