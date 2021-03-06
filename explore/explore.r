source('_drake.R')


read_excel('data/Legend.xlsx') %>%
  janitor::clean_names() %>%
  mutate( summary=make_clean_names( summary )) %>% 
  rename(Category=title) %>%
  { . } -> df_legend

sa3_target = 'Cleveland - Stradbroke'
sa2_target = 'Victoria Point'

sa3_name16

read_excel('data/ARCMAP_ATSI.xlsx') %>%
  janitor::clean_names() %>% 
  { . } -> df_atsi

read_excel('data/ArcMap_CALDTbl.xlsx') %>%
  janitor::clean_names() %>% 
  { . } -> df_cald

read_excel('data/ArcMap_DisData.xlsx') %>%
  janitor::clean_names() %>% 
  { . } -> df_dis

read_excel('data/ArcMap_GP Data.xlsx') %>%
  janitor::clean_names() %>% 
  { . } -> df_pop

blue =  RColorBrewer::brewer.pal(9, 'PuBu')[8]
red =  RColorBrewer::brewer.pal(9, 'OrRd')[8]
grey =  RColorBrewer::brewer.pal(9, 'Greys')[6]

df_atsi %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_atsi) ) %>% 
         pluck('summary')) %>% 
pivot_longer( -starts_with('sa'), names_to='summary', values_to='Percent') %>%
inner_join( df_legend, by='summary') %>%
{ . } -> df_atsi_l
df_atsi_l %>%
  ggplot( aes( Category, Percent)) +
  geom_boxplot(color=grey) +
  geom_jitter( aes(Category, Percent), width=.1,data= df_atsi_l %>% filter(sa3_name16==sa3_target), color = blue) +
  geom_jitter( aes(Category, Percent), data= df_atsi_l %>% filter(sa2_name16==sa2_target), color = red) +
  theme_bw() +
  ggtitle('Health, Social and Demographic Profile of Victoria Point: Aboriginal and/or Torres Strait Islander People') +
  scale_x_discrete(labels = wrap_format(15))

df_cald %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_cald) ) %>% 
         pluck('summary')) %>% 
pivot_longer( -starts_with('sa'), names_to='summary', values_to='Percent') %>%
inner_join( df_legend, by='summary') %>%
{ . } -> df_cald_l
df_cald_l %>%
  ggplot( aes( Category, Percent)) +
  geom_boxplot(color=grey) +
  geom_jitter( aes(Category, Percent), width=.1,data= df_cald_l %>% filter(sa3_name16==sa3_target), color = blue) +
  geom_jitter( aes(Category, Percent), data= df_cald_l %>% filter(sa2_name16==sa2_target), color = red) +
  theme_bw() +
  ggtitle('Health, Social and Demographic Profile of Victoria Point: Culturally and/or Linguistically Diverse People') +
  scale_x_discrete(labels = wrap_format(15))

df_dis %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_dis) ) %>% 
         pluck('summary')) %>% 
pivot_longer( -starts_with('sa'), names_to='summary', values_to='Percent') %>%
inner_join( df_legend, by='summary') %>%
{ . } -> df_dis_l
df_dis_l %>%
  ggplot( aes( Category, Percent)) +
  geom_boxplot(color=grey) +
  geom_jitter( aes(Category, Percent), width=.1,data= df_dis_l %>% filter(sa3_name16==sa3_target), color = blue) +
  geom_jitter( aes(Category, Percent), data= df_dis_l %>% filter(sa2_name16==sa2_target), color = red) +
  theme_bw() +
  ggtitle('Health, Social and Demographic Profile of Victoria Point: People with Disability') +
  scale_x_discrete(labels = wrap_format(15))

df_pop %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_pop) ) %>% 
         pluck('summary')) %>% 
          pivot_longer( -starts_with('sa'), names_to='summary', values_to='Percent') %>%
          inner_join( df_legend, by='summary') %>%
  { . } -> df_pop_l
df_pop_l %>%
  ggplot( aes( Category, Percent)) +
  geom_boxplot(color=grey) +
  geom_jitter( aes(Category, Percent), width=.1,data= df_pop_l %>% filter(sa3_name16==sa3_target), color = blue) +
  geom_jitter( aes(Category, Percent), data= df_pop_l %>% filter(sa2_name16==sa2_target), color = red) +
  theme_bw() +
  ggtitle('Health, Social and Demographic Profile of Victoria Point: General Population') +
  scale_x_discrete(labels = wrap_format(15))


 



df_cald %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_cald) ) %>% 
         pluck('summary')) %>% 
  { . } -> df_cald

df_dis %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_dis) ) %>% 
         pluck('summary')) %>% 
  { . } -> df_dis



df_atsi %>%
  select( sa2_name16, sa3_name16, df_legend %>%
         filter( summary %in% names(df_atsi) ) %>% 
         pluck('summary')) %>% 
  { . } -> df_atsi

