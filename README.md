+ 环境部署
  1. 安装erlang
      ```
      https://github.com/erlang/otp/archive/OTP-19.0.7.tar.gz
     ./configure --prefix=/usr/local/erlang --with-ssl --enable-threads --enable-smp-support --enable-kernel-poll --enable-hipe --without-javac; 
      make && make install;
      echo ERL_HOME=/usr/local/erlang >> /etc/profile;
      echo PATH='$ERL_HOME/bin:$PATH' >> /etc/profile;
      echo export ERL_HOME PATH >> /etc/profile;
      source /etc/profile;
      ```
  2. 安装elixir:https://github.com/elixir-lang/elixir/archive/v1.3.3.tar.gz
  

