res = instrfind;
for k=1:length(res);
  if strcmp(res(k).Type,'udp')
    fclose(res(k));
    delete(res(k));
  end
end
