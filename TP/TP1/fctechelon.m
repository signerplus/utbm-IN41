function [] = fctechelon(size)
  t=-size:1:size;
  f=[zeros(1,size) ones(1,size+1)];
  stem (t,f);
end