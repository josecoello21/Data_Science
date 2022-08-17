# load data
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

vehicle <- SCC %>% 
    mutate(SCC.Level.Two = tolower(as.character(SCC.Level.Two))
    ) %>% 
    filter(str_detect(string = SCC.Level.Two, pattern = 'vehicle'))

datos2 <- semi_join(x = NEI, y = vehicle, by = 'SCC')

png("Plot_6.png", width = 480, height = 480)

datos2 %>% 
    filter(fips %in% c('24510', '06037')) %>% 
    mutate(year = as.factor(year),
           state = ifelse(fips == '24510',
                          'Baltimore',
                          'LA')
    ) %>% 
    group_by(year,state) %>% 
    summarise(total = sum(Emissions)) %>% 
    ggplot(aes(x = year, y = total)) + 
    geom_col() + 
    facet_grid(. ~ state) + 
    labs(title = 'PM2.5 Vehicle Emissions in Baltimore and LA from 1999 to 2008',
         y = 'Total PM2.5 Emissions tons')

dev.off()
