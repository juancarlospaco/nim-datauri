#!/usr/bin/nim c -r


import strformat, strutils, mimetypes, base64, algorithm


proc file2datauri*(filename: string): string =
  fmt"data:{newMimetypes().getMimetype(filename.split('.').reversed()[0])};base64,{encode(readFile(filename))}"


proc datauri2file*(data_uri: string, filename: string): cint =
  writeFile(filename, decode(data_uri.split(",")[1]))


if is_main_module:
  # echo file2datauri("probando.txt")
  echo datauri2file("data:text/plain;charset=utf-8;base64,YQpiCmMKZAplCmYK", "output0.txt")
  echo datauri2file("data:text/plain;base64,YQpiCmMKZAplCmYK", "output1.txt")
