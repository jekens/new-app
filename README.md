# Gserver:使用elixir打造的通用tcp服务器

## 1. 环境部署
  1. 安装erlang

  ```
  yum -y install ncurses-devel;
  yum -y install openssl-devel;
  wget http://www.erlang.org/download/otp_src_19.0.tar.gz;
  ./configure --prefix=/usr/local/erlang --without-javac;
  make && make install;
  echo ERL_HOME=/usr/local/erlang >> /etc/profile;
  echo PATH='$ERL_HOME/bin:$PATH' >> /etc/profile;
  echo export ERL_HOME PATH >> /etc/profile;
  source /etc/profile;
  ```

  2. 安装elixir

  ```
  wget https://github.com/elixir-lang/elixir/archive/v1.3.3.tar.gz;
  make && make install;
  ```

## 2. 使用
  1. Add gserver to your list of dependencies in `mix.exs`:

        def deps do
          [{:gserver, "~> 0.0.1"}]
        end

  2. Ensure gserver is started before your application:

        def application do
          [applications: [:gserver]]
        end
