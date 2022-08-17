# load data
NEI <- readRDS("summarySCC_PM25.rds")

mary <- tapply(filter(.data = NEI, fips == '24510')$Emissions,
               filter(.data = NEI, fips == '24510')$year, 
               FUN = sum)

png("Plot_2.png", width = 480, height = 480)

barplot(height = mary,
        main = 'Total PM2.5 Emissions from Baltimore City',
        ylab = 'PM2.5 Emissions tons',
        xlab = 'Years')

dev.off()
