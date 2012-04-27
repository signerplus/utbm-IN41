function [ ] = fctrectangle( size , frequency )

    t=0:.01:size;
    f= square(2*pi*frequency*t);
    plot (t,f);
end