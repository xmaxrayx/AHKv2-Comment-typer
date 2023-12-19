#Requires AutoHotkey v2.0
#SingleInstance Force
;[Laptop HQ] @xMaxrayx @Unbreakable-ray [Code : ReBorn]   at 17:12:32  on 11/12/2023   (24H Format)  (UTC +2) 	 {Can we prove we are stronger than before?}
global windowsName := ""


F10::{
windowsName := WinGetID("A")  
fastGui("]","[",10,";","=",windowsName)

;MsgBox A_Clipboard

}




;MsgBox Commenter_Func("hello","[","]",15,";","=" )


Commenter_Func(text ,left, right,length,start,commentText ){


    length := numberChecker(length)
    ;length := length * 2
    ;MsgBox length
    textString := (right . left . start . text) 
    textLength := StrLen(textString)
    ; MsgBox length,,262144
   ;length += ((StrLen(text))-2) 
    ;MsgBox length,,262144
    ;MsgBox "text lenght :" textLength ,,"262144"
    totalTextLength :=  length - (textLength/2)
    totalTextLength += ((StrLen(text))+1) 
    ;MsgBox "totalTextLength" totalTextLength , ,262144
    
    ;MsgBox(Replicate(commentText,totalTextLength))

    ; outPutCommentSpamLeft:= (Replicate(commentText,(totalTextLength*2)))
    ; outPutCommentSpamRight:= (Replicate(commentText,(totalTextLength*2)))

    outPutCommentSpamLeft:= (Replicate(commentText,((totalTextLength+length)/2)))
    outPutCommentSpamRight:= (Replicate(commentText,((totalTextLength+length)/2)))
    
    
    outputComment := start . outPutCommentSpamLeft . left . text . right . outPutCommentSpamRight

    return outputComment

    ;===============funcs
    numberChecker(variable ,Msg? , defaultNumber := 25){ ;by xMaxrayx 
        if !IsNumber(variable){
            Msg := Msg?? 'Tell a programmers "length" variable dosn`'t have Number value' . defaultNumber . ' is used instead" '
            return defaultNumber
        }else{
            return variable
        }
        
    }
    
    Replicate( Str, Count ) { ; By SKAN / CD: 01-July-2017 | goo.gl/U84K7J
        Return StrReplace( Format( "{:0" Count "}", "" ), 0, Str )
        }
    
}




;=========================
;==========gui============
;=========================


fastGui(right ,left , length , startComment , spamComment ,windowsName){
fastGui := Gui("AlwaysOnTop -Caption -E0x200 ")
fastGui_Edit := fastGui.Add("Edit","w300 Wrap")  ;.SetFont("s10 cBlack", "Tahoma")
fastGui.Add("Button","x150 +Default", "Ok").OnEvent("Click" , (GuiObj,Info)=> (okButton_func(fastGui_Edit.value,windowsName)))

okButton_func(text,windowsName){
if IsSet(text){
    if text == ""
        {
            fastGui.Destroy()

        }
        else{
           ;MsgBox Commenter_Func(text,left,right,length,startComment,spamComment )
            
            textToAnotherWindow((Commenter_Func(text,left,right,length,startComment,spamComment )),windowsName)
            
            fastGui.Destroy
        }
    }
} ;end of ok button gui

textToAnotherWindow(text, windowsName){
;MsgBox windowsName
;windowsName := windowsName?? "A"
WinActivate(windowsName)
;WinWaitActive(windowsName)
A_Clipboard := text
Sleep(150)
SendInput("{Ctrl Down}v{Ctrl Up}")


}

; sendToCommenter(text){
;     MsgBox Commenter_Func(text,"[","]",15,";","=" )
    
; }


fastGui.OnEvent("Escape", (*) => fastGui.Destroy())






fastGui.Show
}

