function UDPCtrl
warning('off','instrument:fread:unsuccessfulRead');

% this is the UDP Server; Unity is the Client
% however, I could not figure out, how to determine the clients port# after
% connect
% it is now hard coded in Unity at 8051, we send, also hard coded, to 8051
% and we listen at 8052

udp_sock = udp('127.0.0.1',8051,'LocalPort',8052,'ByteOrder','littleEndian','Timeout',20);
fopen(udp_sock);

disp('Quick, get Unity running, you have 20 sec.')

clear lane_keeping_controller %clears persitent variables in controller
run = true;
cnt=0;
while run
  cnt=cnt+1;
  x=fread(udp_sock,4,'single');
  if ~isempty(x)
    %% Here is your controller
    lenkwinkel = controller(x(1),x(2));
    %disp([x(1:2)' lenkwinkel]);
    %%
    fwrite(udp_sock,[lenkwinkel 0 0 0],'single');
  else
    run=false;
    disp('UDP Read timed out!')
  end
  if cnt==10
    disp('Connected, up and running...')
    udp_sock.Timeout=1;%after successful comunication (Unity runs) we timeout more quickly
    fwrite(udp_sock,[lenkwinkel 0 0 0],'single');%to have one extra package in the buffer -> more delay, but more stable frame rate!!
  end
end


fclose(udp_sock);
warning('on','instrument:fread:unsuccessfulRead');
