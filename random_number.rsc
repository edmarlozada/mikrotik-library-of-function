# ------------------------------
# random number generator
# $1 = Number
# :put [$eRandom 1]  => 0
# :put [$eRandom 2]  => 1
# :put [$eRandom 16] => 5
# ------------------------------
/{
:local eRandom do={
  :local nDiv [:tonum $1]
  :local nSum 0
  :foreach i in=[/system resource irq find] do={
    :set nSum ($nSum + [/system resource irq get $i count])
  }
  :return ($nSum % $nDiv)
}
:put [$eRandom 16]
}
# ------------------------------
