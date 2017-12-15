library(MASS)
W = Weights
Y = Pairwise_Comp
vector_names = colnames(Y)
Delta_0 = -W + diag(rowSums(W))
Delta_0 = as.matrix(Delta_0)
Y = as.matrix(Y)
W_transpose = t(as.matrix(W))
div_Y = diag(Y %*% W_transpose)
r = ginv(Delta_0) %*% div_Y
output = data.frame(vector_names, r)
output_sorted = output[with(output, order(-r)), ]
write.csv(output_sorted, file='ranking.csv')