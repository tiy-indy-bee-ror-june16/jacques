## README

### API ENDPOINTS:

#### GET 'https://agile-springs-31596.herokuapp.com/api/users'

On success: Returns index of all users.

```json
{
  "users": [
    {
      "email": "nick@walter.name",
      "api_token": "7126ba2b0c50f86badc1",
      "notes": [
        {
          "title": "The Line of Beauty",
          "body": "Butcher microdosing hammock meditation. Gluten-free church-key post-ironic. Banh mi keytar normcore 8-bit loko green juice bespoke irony. Green juice sriracha cornhole. Blog ethical keffiyeh lomo retro hella flexitarian.",
          "created_at": "2015-08-25T16:27:34Z",
          "updated_at": "2016-07-29T13:11:40Z"
        }
```


#### GET 'https://agile-springs-31596.herokuapp.com/api/notes'

On success: Returns index of all notes.
```json
{
  "notes": [
    {
      "title": "Behold the Man",
      "body": "Vegan fashion axe you probably haven't heard of them ennui blog paleo flannel flexitarian. Cliche hammock park biodiesel marfa you probably haven't heard of them austin squid. Twee messenger bag yolo post-ironic disrupt. Locavore hashtag brunch squid beard deep v bitters. Lumbersexual salvia meggings taxidermy tacos disrupt wolf twee. Intelligentsia hella chambray microdosing. Mumblecore shoreditch gluten-free. Kogi retro health forage shabby chic wayfarers venmo mlkshk.",
      "created_at": "2016-01-14T04:52:40Z",
      "updated_at": "2016-07-29T13:11:39Z",
      "tags": [
        {
          "name": "Sports"
        },
        {
          "name": "Outdoors"
        },
        {
          "name": "Social"
        },
        {
          "name": "The Home"
        }
      ]
    },
```

GET 'http://localhost:3001/api/tags/(:name_of_tag)'

On Success: (:name_of_tag) == 'Romance' {
  "tag": {
    "name": "Romance",
    "notes": [
      {
        "title": "Bury My Heart at Wounded Knee",
        "body": "Lo-fi cronut kale chips pinterest iphone literally. Hoodie roof mumblecore helvetica pug. Tousled disrupt seitan. Irony cleanse squid keffiyeh blue bottle photo booth kombucha. Church-key williamsburg kitsch cold-pressed pour-over. Leggings narwhal organic pickled.",
        "created_at": "2015-07-02T07:00:36Z",
        "updated_at": "2016-07-28T20:02:40Z"
      },
      {
        "title": "The Golden Apples of the Sun",
        "body": "Brunch flannel green juice. Food truck authentic messenger bag vegan wayfarers post-ironic yolo sartorial. Etsy kinfolk synth green juice brunch. Tumblr pinterest before they sold out celiac. Twee pitchfork humblebrag. Jean shorts irony blue bottle fixie drinking kinfolk. Mlkshk pug mustache echo cray quinoa carry. Literally tattooed brooklyn.",
        "created_at": "2015-03-23T04:36:37Z",
        "updated_at": "2016-07-28T20:02:40Z"
      },
```
