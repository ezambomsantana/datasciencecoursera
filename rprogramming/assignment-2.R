poluicao <- function(diretorio, poluente, id = 1:322) {
  
  total <- 0;
  for (i in id) {
    if (i < 10) {
      teste <- paste(paste(paste(diretorio,"00", sep = ""),i, sep = ""),".csv", sep = "");
      leitura <- read.csv(teste);
      total <- rbind(total, leitura[poluente]);
    } else if (i < 100) {
      leitura <- read.csv(paste(paste(paste(diretorio,"0", sep = ""),i, sep = ""),".csv", sep = ""));
      total <- rbind(total, leitura[poluente]);
    } else {
      leitura <- read.csv(paste(paste(diretorio ,i, sep = ""),".csv", sep = ""));
      total <- rbind(total, leitura[poluente]);
    }
  }
  
  removeNA <- is.na(total);
  totalSemnNa <- total[!removeNA]
  mean(totalSemnNa)
  
}

x <- poluicao("C:/coursera/programming-r/data/specdata/", "sulfate", 1:10);

numberComplete <- function(diretorio, id = 1:322) {
  df <- data.frame(x = numeric(length(id)), y = character(length(id)), stringsAsFactors = FALSE)
  for (i in id) {
    if (i < 10) {
      teste <- paste(paste(paste(diretorio,"00", sep = ""),i, sep = ""),".csv", sep = "");
      leitura <- read.csv(teste);
      leituraUm <- leitura[2]
      removeNA <- is.na(leituraUm);
      totalSemnNa <- leituraUm[!removeNA]
      print(totalSemnNa)
      x <- length(totalSemnNa)
      df$x[i] <- i
      df$y[i] <- x
    } else if (i < 100) {
      leitura <- read.csv(paste(paste(paste(diretorio,"0", sep = ""),i, sep = ""),".csv", sep = ""));
      total <- rbind(total, leitura[poluente]);
    } else {
      leitura <- read.csv(paste(paste(diretorio ,i, sep = ""),".csv", sep = ""));
      total <- rbind(total, leitura[poluente]);
    }
  }
  

  df
  
}
x <- numberComplete("C:/coursera/programming-r/data/specdata/", 1:5);
