library(tidyverse)
library(dplyr)
library(stringr)

konkursy   <- read.csv("all_comps.csv")
skoczkowie <- read.csv("all_names.csv")
wyniki     <- read.csv("all_results.csv")
statystyki <- read.csv("all_stats.csv")

konkursy_przefiltrowane <- konkursy %>%
  filter(season == "2014", date >= "2013-11-22")

skoczkowie <- skoczkowie %>%
  arrange(codex)

head(skoczkowie, 5)

skoczkowie %>%
  count(codex) %>%
  filter(n>1)

skoczkowie_unikatowi <- skoczkowie %>%
  distinct(codex, .keep_all = TRUE)

skoczkowie_unikatowi %>%
  count(codex) %>%
  filter(n>1)

statystyki <- statystyki %>%
  rename(id = fis_code, round = round_type)


wyn_sko <- left_join(wyniki, skoczkowie_unikatowi,by = "codex")

wyn_sko_kon <- left_join(wyn_sko, konkursy_przefiltrowane, by = "id")

ostateczne_dane <- left_join(wyn_sko_kon, statystyki, by = c("id", "round"))


ostateczne_dane <- ostateczne_dane %>%
  filter(date >= "2013-11-22", gender == "Men")

ostateczne_dane <- ostateczne_dane %>%
  select(date, id, team, place, hill_size_x, k.point, round, training, codex.x, bib, name, dist, speed, points, dist_points, note_points, wind, wind_comp, gate.x, gate.y, gate_points, humid, snow, air, weather_type) %>%
  rename(competition_id = id, location = place, hill_size=hill_size_x, skijumper_id=codex.x, points_overall=points, wind_compensation=wind_comp, jump_gate=gate.x, competition_start_gate=gate.y, starting_number=bib, air_temperature=air, snow_temperature=snow) %>%
  arrange(date)

str(ostateczne_dane)

table(ostateczne_dane$weather_type)
table(ostateczne_dane$location)
table(ostateczne_dane$round)
table(ostateczne_dane$team)
table(ostateczne_dane$training)

ostateczne_dane <- ostateczne_dane %>%
  mutate(date=as.Date(date), weather_type=as.factor(str_trim(weather_type)), location=as.factor(location), round = as.factor(round))

ostateczne_dane$team <- factor(ostateczne_dane$team, levels = c(0,1))

str(ostateczne_dane)

colSums(is.na(ostateczne_dane))
table(ostateczne_dane$training)

ostateczne_dane<- ostateczne_dane %>%
  filter(training == 0, round != 'qualification')

ostateczne_dane <- ostateczne_dane %>%
  mutate(round = str_trim(round))

colSums(is.na(ostateczne_dane))

table(ostateczne_dane$round)

ostateczne_dane <- ostateczne_dane %>%
  filter(!is.na(wind)) %>%
  filter(!is.na(competition_start_gate)) %>%
  filter(!is.na(humid))

colSums(is.na(ostateczne_dane))

table(ostateczne_dane$weather_type)
