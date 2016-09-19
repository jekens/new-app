## 1. 环境部署
  1. 安装erlang
  
  ```
  yum -y install ncurses-devel;
  %% erlang安装包https://www.erlang-solutions.com/resources/download.html
  wget https://packages.erlang-solutions.com/erlang/esl-erlang/FLAVOUR_1_general/esl-erlang_19.0.7-1~centos~7_amd64.rpm;
  ./configure --prefix=/usr/local/erlang --with-ssl --enable-threads --enable-smp-support --enable-kernel-poll --enable-hipe --without-javac; 
  make && make install;
  echo ERL_HOME=/usr/local/erlang >> /etc/profile;
  echo PATH='$ERL_HOME/bin:$PATH' >> /etc/profile;
  echo export ERL_HOME PATH >> /etc/profile;
  source /etc/profile;
  ```

  2. 安装elixir

  ```
  wget https://github.com/elixir-lang/elixir/archive/v1.3.3.tar.gz;
  ```       
  

