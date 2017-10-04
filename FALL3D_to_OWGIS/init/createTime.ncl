function addTime(fout, dim_time) begin
    ; TODO REMOVE HARD CODED TIME LENGHT
    
    Time = createArray(dim_time) ;Total Time steps
    Time@standard_name = "time"
    Time@long_name = "time"
    ;Time@units = "hours since "+thisDay(0)+"-"+thisDay(1)+"-"+(toint(thisDay(2))-1)+" 00:00:00"
   ; Time@calendar = "gregorian"

	Time@units = "hours since 2017-08-21 00:00:00" ;
	Time@description = "time after 0000UTC" ;

    ntim  = dimsizes(Time)                 ; get dimension sizes  
    dimNames = (/"Time"/)  
    filedimdef(fout, (/"Time"/), -1 , (/ True /))
    filevardef(fout, "Time" ,typeof(Time),"Time") ; Time dimension
    filevarattdef(fout,"Time",Time)                  ; copy Longitude attributes
    fout->Time   = (/Time/)     
    return Time
end
