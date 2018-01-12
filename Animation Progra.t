const SPEED:=20
var numFrames : int := Pic.Frames ("Evil Cloud.Gif")
var numFrames1:int:=Pic.Frames("fire1.Gif")
var pics : array 1 .. numFrames of int
var pics1:array 1.. numFrames1 of int
var delaytime,delaytime1 : int := 20
var sprite, x, i, y : int := 30
var chars : array char of boolean
var hitbox,hitbox1:int
Pic.FileNewFrames ("Evil Cloud.gif", pics, x)
setscreen("graphics:860,855")
sprite := Sprite.New (pics (1))
i := 1
Pic.ScreenLoad("base map.bmp",0,0,picCopy)
Pic.ScreenLoad("blue car.bmp",450,500,picMerge)
procedure animation1
for i:1..367
Pic.ScreenLoad("blue car.bmp",450+i,500,picXor)
delay(12)
end for
end animation1
loop
    Sprite.Animate (sprite, pics (i), x, y, false)
    Sprite.SetPosition (sprite, x, y, false)
    Sprite.Show (sprite)
    Input.KeyDown (chars)
    if chars (KEY_RIGHT_ARROW) and x < 615 then
	x := x + SPEED
    elsif chars (KEY_LEFT_ARROW) and x > 5 then
	x := x - SPEED
    elsif chars (KEY_UP_ARROW) and y < 735 then
	y := y + SPEED
    elsif chars (KEY_DOWN_ARROW) and y > 5 then
	y := y - SPEED
    end if
    delay (60)
    i := i + 1

    if i > numFrames then
	i := 1
	end if
    end loop
