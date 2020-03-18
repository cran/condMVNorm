\name{cmvnorm}
\alias{dcmvnorm}
\alias{rcmvnorm}
\title{Conditional Multivariate Normal Density and Random Deviates}
\description{
  These functions provide the density function and a random number
  generator for the conditional multivariate normal
  distribution, [Y given X], where Z = (X,Y) is the fully-joint multivariate normal distribution with mean equal to \code{mean} and covariance matrix
  \code{sigma}.
}
\usage{
dcmvnorm(x, mean, sigma, dependent.ind, given.ind, 
	X.given, check.sigma=TRUE, log = FALSE)
rcmvnorm(n, mean, sigma, dependent.ind, given.ind, 
	X.given, check.sigma=TRUE, 
	method=c("eigen", "svd", "chol"))
}
\arguments{
 \item{x}{vector or matrix of quantiles of Y. If \code{x} is a matrix, each
   row is taken to be a quantile.}
 \item{n}{number of random deviates.}
 \item{mean}{mean vector, which must be specified.}
 \item{sigma}{a symmetric, positive-definte matrix of dimension n x n, which must be specified.}
 \item{dependent.ind}{a vector of integers denoting the indices of dependent variable Y.}
 \item{given.ind}{a vector of integers denoting the indices of conditioning variable X. If specified as integer vector of length zero or left unspecified, the unconditional distribution is used.}
 \item{X.given}{a vector of reals denoting the conditioning value of X. This should be of the same length as \code{given.ind}}
 \item{check.sigma}{logical; if \code{TRUE}, the variance-covariance matrix is checked for appropriateness (symmetry, positive-definiteness). This could be set to FALSE if the user knows it is appropriate.}
 \item{log}{logical; if \code{TRUE}, densities d are given as log(d).}
 \item{method}{string specifying the matrix decomposition used to
   determine the matrix root of \code{sigma}.  Possible methods are
   eigenvalue decomposition (\code{"eigen"}, default),
   singular value decomposition (\code{"svd"}), and
   Cholesky decomposition (\code{"chol"}).  The
   Cholesky is typically fastest, not by much though.}
}
\seealso{\code{\link{pcmvnorm}}, \code{\link{pmvnorm}}, \code{\link{dmvnorm}}, \code{\link{qmvnorm}}}
\examples{
# 10-dimensional multivariate normal distribution
n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A \%*\% t(A)

# density of Z[c(2,5)] given Z[c(1,4,7,9)]=c(1,1,0,-1)
dcmvnorm(x=c(1.2,-1), mean=rep(1,n), sigma=A, 
	dependent.ind=c(2,5), given.ind=c(1,4,7,9), 
	X.given=c(1,1,0,-1))

dcmvnorm(x=-1, mean=rep(1,n), sigma=A, dep=3, given=c(1,4,7,9,10), 
  X=c(1,1,0,0,-1))

dcmvnorm(x=c(1.2,-1), mean=rep(1,n), sigma=A, dep=c(2,5), 
  given=integer())

# gives an error since `x' and `dep' are incompatibe
#dcmvnorm(x=-1, mean=rep(1,n), sigma=A, dep=c(2,3), 
#	given=c(1,4,7,9,10), X=c(1,1,0,0,-1))

rcmvnorm(n=10, mean=rep(1,n), sigma=A, dep=c(2,5), 
	given=c(1,4,7,9,10), X=c(1,1,0,0,-1), 
	method="eigen")

rcmvnorm(n=10, mean=rep(1,n), sigma=A, dep=3, 
	given=c(1,4,7,9,10), X=c(1,1,0,0,-1), 
	method="chol")
}
\keyword{distribution}
\keyword{multivariate}
