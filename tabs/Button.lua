Button = class()

function Button:init(t,x,y,col,cb)
    -- you can accept and set parameters here
    self.text = t
    self.x = x
    self.y = y
    self.color = col
    self.callback = cb or function() end
end

function Button:draw()
    -- If state == "menu" then do....
    if (state=="menu") then
    rectMode(CENTER)
    fill(255, 0, 12, 255)
    rect(self.x, self.y, string.len(self.text)*fontSize(), fontSize()*1.75) -- Draw a rectangle where the 
-- button is
    end
    textMode(CENTER)
    fill(0, 255, 14, 120)
    text(self.text, self.x, self.y)    
end

function Button:touched(touch)
    -- Codea does not automatically call this method
    if (touch.x > self.x-string.len(self.text)*fontSize()/2 and
    touch.x < self.x+string.len(self.text)*fontSize()/2 and
    touch.y > self.y-string.len(self.text)*fontSize()/2 and
    touch.y < self.y+string.len(self.text)*fontSize()/2 and
    touch.state == BEGAN) then
        sound(SOUND_PICKUP, 38870)
        self.callback()
end
end


