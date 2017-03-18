function setup()
    -- Almost irrelevent stuff here
    displayMode(FULLSCREEN)
    supportedOrientations(LANDSCAPE_RIGHT)
    
    -- Defines positions for the "I" btton
    menubuttonx=500
    menubuttony=100 
    -- Sets the state of the game
    state = "menu"
    -- These buttons are classified as "menu" buttons, you can make different buttons like this
    -- WIDTH/2 & HEIGHT*.5 is where the button will be, color is the color of the button, 
    -- For your button to do something put 'function()', then a function to do..close()..then end the function
    menuButtons = {
        Button("restart", WIDTH/2, HEIGHT*.5, color(255, 0, 0, 255), function() close() end),}
    
    -- These buttons are classified as "Not" menu buttons you can make different buttons like this
    NotmenuButtons = {
    Button("restart", WIDTH/2, HEIGHT*.5, color(94, 210, 13, 255), function() close() end),}
end
-------------------------------------------------------------------------------------------------------------
function draw()
    -- If the state of the game is "menu" then do all this
    if (state == "menu") then
    -- Draws the text "Buttons" at the top of screen, basically does nothing 
        fontSize(96)
        font("Baskerville-Bold")
        fill(255, 0, 20, 255)
        text("Buttons", WIDTH/2, HEIGHT-200)
    -- This is where is actually draws the button, without this nothing would show up!
    -- "munuButtons" is the set of button(s) that you made up in the setup function
    -- Change that to the diffrent set of buttons and it will load that button 
    -- IE, delete the "Not" so it is just menubuttons like this.....
    --[[ for i,v in ipairs(menuButtons) do
        fontSize(48)
        v:draw()--]]
    --         ⬇
        for i,v in ipairs(NotmenuButtons) do
        fontSize(48)
        v:draw()
    -- This is drawing the circle on screen for the i button   
        fill(27, 249, 16, 109)
    -- Draws a green circle at positions menubuttonx & menubuttony
        ellipse(menubuttonx,menubuttony,100)
            pushStyle() -- Saves settings, so that the last fill doesnt get over rided by the new fill
        fill(0, 0, 0, 255)
    -- Puts the i in the same location as the circle above
        text("i",menubuttonx,menubuttony)
            popStyle() -- Restores the settings
end 
end
end   
 
function touched(touch)
    -- If the state of the game is "menu" then do the following
    if (state == "menu") then
    -- This is just saying that only the "NotmenuButtons" will be affected by a touch
        for i,v in ipairs(NotmenuButtons) do
        v:touched(touch)
end    
    -- This is the touch stuff for the circle button, it says that if the x cordinate of a touch is farther   than 500 pixels to the right but less than 559 pixels to the right and the same for the y cordinate of a touch thats higher than 50 pixels up and less than 150 pixels then do somthing                  
    if touch.x > 500 and
    touch.x < 550 and
    touch.y > 50 and
    touch.y < 150 then
-- If these conditions are true, it closes the game
    close()
                
end
end
end