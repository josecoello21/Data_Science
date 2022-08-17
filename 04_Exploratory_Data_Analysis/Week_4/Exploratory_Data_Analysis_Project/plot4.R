# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

coal_comb <- SCC %>% 
    mutate(SCC.Level.One = tolower(as.character(SCC.Level.One)),
           SCC.Level.Four = tolower(as.character(SCC.Level.Four))
    ) %>% 
    filter(str_detect(string = SCC.Level.One, pattern = 'combustion'),
           str_detect(string = SCC.Level.Four, pattern = 'coal'))

datos <- semi_join(x = NEI, y = coal_comb, by = 'SCC')

png("Plot_4.png", width = 480, height = 480)

datos %>% 
    mutate(year = as.factor(year)) %>% 
    group_by(year) %>% 
    summarise(total = sum(Emissions)/1000) %>% 
    ggplot(aes(x = year, y = total)) + 
    geom_col() + 
    labs(title = 'PM2.5 Coal Combustion Emissions across USA from 1999 to 2008',
         y = 'Total PM2.5 Emissions (10^3) tons')

dev.off()
