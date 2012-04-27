function []= fctsigne(size)
  t=-size:1:size;
  f=[-ones(1,size) 0 ones(1,size)];
  plot(t,f);
end