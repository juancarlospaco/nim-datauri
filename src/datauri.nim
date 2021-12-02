import std/[strutils, mimetypes, base64]

template file2datauriImpl(filename, mime: string) =
  result = "data:"
  result.add mime
  result.add ';'
  result.add 'b'
  result.add 'a'
  result.add 's'
  result.add 'e'
  result.add '6'
  result.add '4'
  result.add ','
  result.add encode(readFile(filename))

proc file2datauri*(filename: string): string =
  assert filename.len > 0, "filename must not be empty string"
  let db: MimeDB = newMimetypes()
  file2datauriImpl(filename, db.getMimetype(filename.split('.')[^1]))

proc file2datauri*(filename, mime: string): string =
  assert filename.len > 0, "filename must not be empty string"
  file2datauriImpl(filename, mime)

template datauri2file*(dataUri, filename: string) =
  assert dataUri.len > 0, "dataUri must not be empty string"
  assert filename.len > 0, "filename must not be empty string"
  writeFile(filename, decode(dataUri.split(',', 1)[1]))


when isMainModule:
  echo file2datauri("datauri.nim")
  datauri2file("data:text/plain;charset=utf-8;base64,YQpiCmMKZAplCmYK", "output0.txt")
  datauri2file("data:text/plain;base64,YQpiCmMKZAplCmYK", "output1.txt")
