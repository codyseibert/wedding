request = require 'request-json'
client = request.createClient 'http://weddingapi.codyseibert.com/'
client.headers['Authorization'] = 'admin 123456'
return

reservations = [
  username: 'charity'
  password: 'ourwedding'
  party: [
    name: 'Charity'
    isVegetarian: false
    reserved: false
  ,
    name: 'Robert'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'petronilla'
  password: 'ourwedding'
  party: [
    name: 'Petronilla'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'hope'
  password: 'ourwedding'
  party: [
    name: 'Hope'
    isVegetarian: false
    reserved: false
  ,
    name: 'Isaac'
    isVegetarian: false
    reserved: false
  ,
    name: 'Justin'
    isVegetarian: false
    reserved: false
  ,
    name: 'Alvin'
    isVegetarian: false
    reserved: false
  ,
    name: 'Devon'
    isVegetarian: false
    reserved: false
  ,
    name: 'Sean'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'thandy'
  password: 'ourwedding'
  party: [
    name: 'Thandy'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'thandy'
  password: 'ourwedding'
  party: [
    name: 'Thandy'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'cliff'
  password: 'ourwedding'
  party: [
    name: 'Cliff'
    isVegetarian: false
    reserved: false
  ,
    name: 'Uitsile'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'volsie'
  password: 'ourwedding'
  party: [
    name: 'Volsie'
    isVegetarian: false
    reserved: false
  ,
    name: 'Tacu'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'mwila'
  password: 'ourwedding'
  party: [
    name: 'Mwila'
    isVegetarian: false
    reserved: false
  ,
    name: 'Beth'
    isVegetarian: false
    reserved: false
  ,
    name: 'Chikobe'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'sharon'
  password: 'ourwedding'
  party: [
    name: 'Sharon'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'rochelle'
  password: 'ourwedding'
  party: [
    name: 'Rochelle'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'chrisc'
  password: 'ourwedding'
  party: [
    name: 'Chris'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'kim'
  password: 'ourwedding'
  party: [
    name: 'Kim'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'bridgette'
  password: 'ourwedding'
  party: [
    name: 'Bridgette'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'ben'
  password: 'ourwedding'
  party: [
    name: 'Ben'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'winnie'
  password: 'ourwedding'
  party: [
    name: 'Winnie'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'jason'
  password: 'ourwedding'
  party: [
    name: 'Jason'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'mark'
  password: 'ourwedding'
  party: [
    name: 'Mark'
    isVegetarian: false
    reserved: false
  ,
    name: 'Lauren'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'ace'
  password: 'ourwedding'
  party: [
    name: 'Ace'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'melissa'
  password: 'ourwedding'
  party: [
    name: 'Melissa'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'janet'
  password: 'ourwedding'
  party: [
    name: 'Janet'
    isVegetarian: false
    reserved: false
  ,
    name: "Janet's +1"
    isVegetarian: false
    reserved: false
  ]
,
  username: 'kaleb'
  password: 'ourwedding'
  party: [
    name: 'Kaleb'
    isVegetarian: false
    reserved: false
  ,
    name: 'Lindsey'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'matt'
  password: 'ourwedding'
  party: [
    name: 'Matt'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'ashley'
  password: 'ourwedding'
  party: [
    name: 'Ashley'
    isVegetarian: false
    reserved: false
  ,
    name: 'Keith'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'ana'
  password: 'ourwedding'
  party: [
    name: 'Ana'
    isVegetarian: false
    reserved: false
  ,
    name: 'Dan'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'michael'
  password: 'ourwedding'
  party: [
    name: 'Michael'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'lisa'
  password: 'ourwedding'
  party: [
    name: 'Lisa'
    isVegetarian: false
    reserved: false
  ,
    name: 'Mimi'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'carl'
  password: 'ourwedding'
  party: [
    name: 'Carl'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'hannah'
  password: 'ourwedding'
  party: [
    name: 'Hannah'
    isVegetarian: false
    reserved: false
  ,
    name: 'Harold'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'prince'
  password: 'ourwedding'
  party: [
    name: 'Prince'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'eddie'
  password: 'ourwedding'
  party: [
    name: 'Eddie'
    isVegetarian: false
    reserved: false
  ,
    name: 'Javu'
    isVegetarian: false
    reserved: false
  ,
    name: "Eddie's Wife"
    isVegetarian: false
    reserved: false
  ]
,
  username: 'payden'
  password: 'ourwedding'
  party: [
    name: 'Payden'
    isVegetarian: false
    reserved: false
  ,
    name: 'Caitlin'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'jamie'
  password: 'ourwedding'
  party: [
    name: 'Jamie'
    isVegetarian: false
    reserved: false
  ,
    name: 'David'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'jm'
  password: 'ourwedding'
  party: [
    name: 'JM'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'brian'
  password: 'ourwedding'
  party: [
    name: 'Brian'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'neel'
  password: 'ourwedding'
  party: [
    name: 'Neel'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'richard'
  password: 'ourwedding'
  party: [
    name: 'Richard'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'tina'
  password: 'ourwedding'
  party: [
    name: 'Tina'
    isVegetarian: false
    reserved: false
  ,
    name: "Tina's +1"
    isVegetarian: false
    reserved: false
  ]
,
  username: 'guillermo'
  password: 'ourwedding'
  party: [
    name: 'Guillermo'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'sean'
  password: 'ourwedding'
  party: [
    name: 'Sean'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'chriso'
  password: 'ourwedding'
  party: [
    name: 'Chris'
    isVegetarian: false
    reserved: false
  ]
,
  username: 'min'
  password: 'ourwedding'
  party: [
    name: 'Min'
    isVegetarian: false
    reserved: false
  ,
    name: 'Scott'
    isVegetarian: false
    reserved: false
  ]
]

for reservation in reservations
  client.post 'reservations', reservation, (err, res, body) ->
    console.log err
