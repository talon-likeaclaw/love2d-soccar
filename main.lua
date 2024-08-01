-- main.lua
local world
local car
local ball

function love.load()
  love.physics.setMeter(64) -- 1 meter = 64 pixels
  world = love.physics.newWorld(0, 0, true)

  -- Car setup
  car = {}
  car.body = love.physics.newBody(world, 400, 300, 'dynamic')
  car.shape = love.physics.newRectangleShape(50, 30)
  car.fixture = love.physics.newFixture(car.body, car.shape)

  -- Ball setup
  ball = {}
  ball.body = love.physics.newBody(world, 400, 200, 'dynamic')
  ball.shape = love.physics.newCircleShape(15)
  ball.fixture = love.physics.newFixture(ball.body, ball.shape)
end

function love.update(dt)
  world:update(dt)
end

function love.draw()
  love.graphics.polygon('line', car.body:getWorldPoints(car.shape:getPoints()))
  love.graphics.circle('line', ball.body:getX(), ball.body:getY(), ball.shape:getRadius())
end
