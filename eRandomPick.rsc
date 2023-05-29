# ------------------------------
# random pick char on string
# $1 = String
# call: eRandom
# :put [$eRandomPick "1"] => "0"
# :put [$eRandomPick "01"] => "1"
# :put [$eRandomPick "0123456789ABCDEF"] => "A"
# ------------------------------
/{
:local eRandomPick do={
  :local eRandom do={
    :local nDiv [:tonum $1]
    :local nSum 0
    :foreach i in=[/system resource irq find] do={
      :set nSum ($nSum + [/system resource irq get $i count])
    }
    :return ($nSum % $nDiv)
  }
  :local eRandom [:parse [/system script get sc-eRandom source]]
  :local cStr $1
  :local nLen [:len $cStr]
  :local nRan [$eRandom $nLen]
  :local iRet [:pick $cStr $nRan]
  :return $iRet
}
:put [$eRandomPick "0123456789ABCDEF"]
}
