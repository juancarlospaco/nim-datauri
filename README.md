# nim-datauri

- Data URI Base64 UTF-8 Nim module.


# Install

```
nimble install datauri
```


# Requisites

- [Nim](https://nim-lang.org)


# Documentation

<details>
    <summary><b>file2datauri()</b></summary>

**Description:**
Convert a file path string to a Data URI Base64 string.

**Arguments:**
- `filename` A file path string, `string` type, required.

**Returns:**  Data URI Base64 `string` type.

</details>


<details>
    <summary><b>datauri2file()</b></summary>

**Description:**
Convert a Data URI Base64 string to a file.

**Arguments:**
- `datauri` A  Data URI Base64 , `string` type, required.
- `filename` A file path string, `string` type, required.

**Returns:** Return value of `writeFile()`, `cint` type.

</details>
