intercala.c <- function(df1, df2){
  n1 <- ncol(df1)
  n2 <- ncol(df2)
  
  # Determine the maximum number of columns
  max_cols <- max(n1, n2)
  
  # Create an empty list to hold the intercalated columns
  intercalated_list <- vector("list", n1 + n2)
  
  # Intercalate columns
  for (i in 1:max_cols) {
    if (i <= n1) {
      intercalated_list[[2 * i - 1]] <- df1[, i, drop = FALSE]
    }
    if (i <= n2) {
      intercalated_list[[2 * i]] <- df2[, i, drop = FALSE]
    }
  }
  
  # Combine the columns into a single data frame
  intercalated_df <- do.call(cbind, intercalated_list)
  
  return(intercalated_df)
}
