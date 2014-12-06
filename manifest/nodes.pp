node 'Default' {
  file {'/tmp/hello.txt':
    content => "Hola Mundo \n",
  }
}
