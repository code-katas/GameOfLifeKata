Cell = {}
function Cell.new()
  local o = {}
  o.neighbors = {}
  o.Alive = 0
  o.currentState = {}
  o.nextState = {}
  setmetatable(o, { __index = Cell })
  return o
end

World = {}
function World.new()
  local o = {}
  o.Cells = {}

  o.Cells[0] = Cell.new()

  o.CurrentTick = 0
  setmetatable(o, { __index = World })
  return o
end

function World.tick (self)
  love.graphics.print("World Tick...", 10, 50)
  self.CurrentTick = self.CurrentTick + 1
  love.graphics.print(tostring(self.CurrentTick), 100, 50)

  --for c1 in self.Cells do
  --  c1.nextState = {};
  --end

  --for c2 in self.Cells do
  --  c2.currentState = c2.nextState;
  --  c2.nextState = {};
  --end

  sleep(1)
end

local clock = os.clock
function sleep(n)  -- seconds
  local t0 = clock()
  while clock() - t0 <= n do end
end

function love.load(arg)
  love.graphics.setNewFont(12)
  love.graphics.setColor(0,0,0)
  love.graphics.setBackgroundColor(255,255,255)

  w = World.new();
end



function love.draw()
   love.graphics.print("Any live cell with fewer than two live neighbours dies, as if caused by under-population.", 10, 10)

   w.tick(w);

   love.graphics.print(tostring(w.Cells[0].Alive == false), 10, 25);
end


function love.quit()
  print("Thanks for playing! Come back soon!")
end
