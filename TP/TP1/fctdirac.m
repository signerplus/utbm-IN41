function [] = fctdirac (size)
  t=-size:1:size;
  f=[zeros(1,size) 1 zeros(1,size)];
  stem(t,f);
end