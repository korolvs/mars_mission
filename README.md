# Mars mission

## Used technologies:

- Ruby
- MiniTest
- Docker

## Run

### With docker

I'm using docker to keep my work environment clear(at least trying to)

**Build**

```
docker build -t mars_mission .
```

**Run**

```
docker run -it mars_mission
```

**Test**

```
docker run mars_mission rake test
```


### Without docker

**Build**

```
bundle install
```

**Run**

```
ruby app.rb
```

**Test**

```
rake test
```