# load data
NEI <- readRDS("summarySCC_PM25.rds")

png("Plot_3.png", width = 480, height = 480)

NEI %>% 
    filter(fips == '24510') %>% 
    group_by(type, year) %>% 
    summarise(total = sum(Emissions)) %>% 
    mutate(year = as.factor(year)) %>%  
    ggplot(aes(x = year, y = total)) + 
    geom_col() + 
    facet_grid(. ~ type) + 
    labs(title = 'PM2.5 Emissions from Baltimore City by Source Type',
         y = 'Total PM2.5 Emissions tons')

dev.off()
