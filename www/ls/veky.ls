return unless window.location.hash == '#veky'
categories =
  "0-4 let"
  "5-9 let"
  "10-14 let"
  "15-19 let"
  "20-24 let"
  "25-29 let"
  "30-34 let"
  "35-39 let"
  "40-44 let"
  "45-49 let"
  "50-54 let"
  "55-59 let"
  "60-64 let"
  "65-69 let"
  "70-74 let"
  "75-79 let"
  "80-84 let"
  "85+ let"

data = d3.tsv.parse ig.data.veky, (row) ->
  data = for category, categoryIndex in categories
    y: parseFloat row[category]
    x: categoryIndex
    label: category
  max = d3.max data.map (.y)

  title = switch row.diagnoza
    | "Novotvary nezhoubné a neznámého chování"
      "Novotvary nezhoubné<br>a neznámého chování"
    | "Předstojná žláza - prostata"
      "Prostata"
    | "Tlusté střevo a konečník"
      "Tlusté střevo<br>a konečník"
    | "Hrdlo děložní - cervicis uteri"
      "Hrdlo děložní"
    | "Prs - ženy"
      "Prs"
    | "Průdušnice, průdušky a plíce"
      "Průdušnice, průdušky<br>a plíce"
    | "Játra a intrahepatální žlučové cesty"
      "Játra<br> a intrahepatální<br>žlučové cesty"
    | otherwise => row.diagnoza
  {data, title, max}
data.sort (a, b) -> b.max - a.max

parent = d3.select ig.containers.base
container = parent.append \div
  ..attr \class \lines
new ig.Lines container, data, categories
