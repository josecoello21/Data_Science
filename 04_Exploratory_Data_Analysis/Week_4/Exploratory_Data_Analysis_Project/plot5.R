# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle <- SCC %>% 
    mutate(SCC.Level.Two = tolower(as.character(SCC.Level.Two))
    ) %>% 
    filter(str_detect(string = SCC.Level.Two, pattern = 'vehicle'))

datos2 <- semi_join(x = NEI, y = vehicle, by = 'SCC')

png("Plot_5.png", width = 480, height = 480)

datos2 %>% 
    mutate(year = as.factor(year)) %>% 
    filter(fips == '24510') %>% 
    group_by(year) %>% 
    summarise(total = sum(Emissions)) %>% 
    ggplot(aes(x = year, y = total)) + 
    geom_col() + 
    labs(title = 'PM2.5 Vehicle Emissions in Baltimore City from 1999 to 2008',
         y = 'Total PM2.5 Emissions tons')

dev.off()
