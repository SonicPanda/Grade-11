%Lottery Program
setscreen("graphics:900,620")
var userNum,winNum:array 1..6 of int
var temp,count,x,y,z,numx,numy,cirx,ciry:int:=0
var check:array 1..49 of boolean
var colors:array 1..12 of int
var done,done1:boolean:=false
var clickbox:array 1..49 of 
record
    x1:int
    x2:int
    y1:int
    y2:int
end record
var options:array 1..49 of int
var title,font,font1:int
font:=Font.New("calibri:22")
font1:=Font.New("calibri:32")
function ptinrect (h, v, x1, v1, x2, v2 : int) : boolean
    result (h > x1) and (h < x2) and (v > v1) and (v < v2)
end ptinrect
%procedures
procedure titlepage
    Pic.ScreenLoad("objects/Title.bmp",0,0,picCopy)
    title:=Pic.New(0,0,maxx,maxy)
    cls
    Pic.DrawSpecial(title,0,0,picCopy,picFadeIn,1000)
    /*Draw.Box(18,12,391,133,black)
    Draw.Box(maxx-382,10,maxx-8,131,black)*/
end titlepage
procedure resetcheck
    for i:1..49
        check(i):=false
    end for
end resetcheck
proc list
    for i:1..49
        options(i):=i
    end for
end list
procedure wherebox
    for i:1..10
        clickbox(i).x1:=180+((i-1)*58)
        clickbox(i).x2:=224+((i-1)*58)
        clickbox(i).y1:=436
        clickbox(i).y2:=480
        %Draw.Box(clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2,black)
    end for
        for i:11..20
        clickbox(i).x1:=180+((i-11)*58)
        clickbox(i).x2:=224+((i-11)*58)
        clickbox(i).y1:=361
        clickbox(i).y2:=405
        %Draw.Box(clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2,black)
    end for
        for i:21..30
        clickbox(i).x1:=180+((i-21)*58)
        clickbox(i).x2:=224+((i-21)*58)
        clickbox(i).y1:=286
        clickbox(i).y2:=330
        %Draw.Box(clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2,black)
    end for
        for i:31..40
        clickbox(i).x1:=180+((i-31)*58)
        clickbox(i).x2:=224+((i-31)*58)
        clickbox(i).y1:=211
        clickbox(i).y2:=255
        %Draw.Box(clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2,black)
    end for
        for i:41..49
        clickbox(i).x1:=180+((i-41)*58)
        clickbox(i).x2:=224+((i-41)*58)
        clickbox(i).y1:=136
        clickbox(i).y2:=180
        %Draw.Box(clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2,black)
    end for
end wherebox
procedure drawnumbers
    numx:=193
    numy:=450
    cirx:=202
    ciry:=458
    for i:1..10
        Font.Draw(""+intstr(i)+"",numx+57*(i-1),numy,font,blue)
        Draw.Oval(cirx+58*(i-1),ciry,22,22,blue)
        Draw.Oval(cirx+58*(i-1),ciry,23,23,blue)
        Draw.Oval(cirx+58*(i-1),ciry,24,24,blue)
    end for
        numy:=375
    ciry:=383
    for i:1..10
        Font.Draw(""+intstr(i+10)+"",numx+57*(i-1),numy,font,blue)
        Draw.Oval(cirx+58*(i-1),ciry,22,22,blue)
        Draw.Oval(cirx+58*(i-1),ciry,23,23,blue)
        Draw.Oval(cirx+58*(i-1),ciry,24,24,blue)
    end for
        ciry:=308
    numy:=300
    for i:1..10
        Font.Draw(""+intstr(i+20)+"",numx+57*(i-1),numy,font,blue)
        Draw.Oval(cirx+58*(i-1),ciry,22,22,blue)
        Draw.Oval(cirx+58*(i-1),ciry,23,23,blue)
        Draw.Oval(cirx+58*(i-1),ciry,24,24,blue)
    end for
        ciry:=233
    numy:=225
    for i:1..10
        Font.Draw(""+intstr(i+30)+"",numx+57*(i-1),numy,font,blue)
        Draw.Oval(cirx+58*(i-1),ciry,22,22,blue)
        Draw.Oval(cirx+58*(i-1),ciry,23,23,blue)
        Draw.Oval(cirx+58*(i-1),ciry,24,24,blue)
    end for
        ciry:=158
    numy:=150
    for i:1..9
        Font.Draw(""+intstr(i+40)+"",numx+57*(i-1),numy,font,blue)
        Draw.Oval(cirx+58*(i-1),ciry,22,22,blue)
        Draw.Oval(cirx+58*(i-1),ciry,23,23,blue)
        Draw.Oval(cirx+58*(i-1),ciry,24,24,blue)
    end for
end drawnumbers
procedure userPick
    cls
    Pic.ScreenLoad("objects/pickpicture.bmp",-50,-50,picCopy)
    drawnumbers
    wherebox
    for j:1..6
        done:=false
        %put j,"first for loop"
        loop
            done1:=false
            count+=1
            Font.Draw(intstr(count),maxx-200,100,font,black)
            buttonwait("down",x,y,z,z)
            for i:1..49
                %check answer loop
                loop
                    if ptinrect (x,y,clickbox(i).x1,clickbox(i).y1,clickbox(i).x2,clickbox(i).y2)then
                        if check(i)=true then
                            done1:=true
                            exit
                        elsif check(i)=false then
                            userNum(j):=i
                            check(i):=true
                            Pic.ScreenLoad("objects/x.bmp",clickbox(i).x1,clickbox(i).y1,picMerge)
                            Font.Draw(intstr(userNum(j)),180+(j-1)*40,80,font,blue)
                            done:=true
                            exit
                        end if
                    else
                        exit                    
                    end if
                end loop
                if done=true or done1=true then 
                    exit
                end if
            end for
                exit when done=true
        end loop
    end for
end userPick
procedure userGen
    for i:1..upper(userNum)
        randint(userNum (i),1,49)
        loop
            if check(userNum(i))=true then
                randint(userNum(i),1,49)
            elsif check(userNum(i))=false then
                check(userNum(i)):=true
                exit
            else
            end if
        end loop
    end for
        for j:1..5
        for i:1..5
            if userNum(i)>userNum(i+1)then
                temp:=userNum(i)
                userNum(i):=userNum(i+1)
                userNum(i+1):=temp
            end if
        end for
    end for
end userGen
procedure genWin
    for i:1..upper(winNum)
        randint(winNum (i),1,49)
        loop
            if check(winNum(i))=true then
                randint(winNum(i),1,49)
            elsif check(winNum(i))=false then
                check(winNum(i)):=true
                exit
            else
            end if
        end loop
    end for
        for j:1..5
        for i:1..5
            if winNum(i)>winNum(i+1)then
                temp:=winNum(i)
                winNum(i):=winNum(i+1)
                winNum(i+1):=temp
            end if
        end for
    end for
end genWin
proc drawgen
    userGen
    cls
    colors(1):= blue
    colors(2):= 46
    colors(3):= 40
    colors(4):= green
    colors(5):= 15
    colors(6):= 36
    %This is crappy, get pictures
    for i:1..6
        drawfilloval(100+100*(i-1),400,44,44,colors(i))
        drawfilloval(100+100*(i-1),400,34,34,white)
        Font.Draw(intstr(userNum(i)),75+100*(i-1),385,font1,black)
    end for
end drawgen
procedure wincheck
    drawgen
    for i:1..6
        put userNum(i)," "..
    end for
        put""
    for k:1..6
        put winNum(k)," "..
    end for
        for j:1..6
        put" "
        for i:1..6
            if winNum(j)=userNum(i) then
                count +=1
                put ""
                put winNum(j)
            end if
        end for
    end for
end wincheck
resetcheck
titlepage
loop
    buttonwait("down",x,y,z,z)
    if ptinrect(x,y,18,12,391,133)then
        userPick
        exit
    elsif ptinrect(x,y,maxx-382,10,maxx-8,131) then
        drawgen
        exit
    else
    end if
end loop
genWin
wincheck
put "You matched ",count," numbers"
