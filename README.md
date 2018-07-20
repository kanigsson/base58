# Ada code for encoding a string into base58

The code has been tested very little. However, it has been proved free of
runtime errors using SPARK.

The code has been heavily inspired from the
[libbase58](https://github.com/luke-jr/libbase58) library. See also the
`COPYING_ORIGINAL` file.


## Requirements

* You need the GNAT compiler to build the code. You need SPARK to verify the
  code.

## How to build

Run `gprbuild -P base.gpr` to build the project.

## How to prove absence of runtime errors

Run `gnatprove -P base` to verify the project. As there are no contracts, only
absence of runtime errors is checked.
