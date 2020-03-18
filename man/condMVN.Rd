\name{condMVN}
\alias{condMVN}
\title{Conditional Mean and Variance of Multivariate Normal Distribution}
\description{
These functions provide the conditional mean and variance-covariance matrix of [Y given X], where Z = (X,Y) is the fully-joint multivariate normal distribution with mean equal to \code{mean} and covariance matrix \code{sigma}.
}
\usage{
condMVN(mean, sigma, dependent.ind, given.ind, X.given, check.sigma=TRUE)
}
\arguments{
 \item{mean}{mean vector, which must be specified.}
 \item{sigma}{a symmetric, positive-definte matrix of dimension n x n, which must be specified.}
 \item{dependent.ind}{a vector of integers denoting the indices of dependent variable Y.}
 \item{given.ind}{a vector of integers denoting the indices of conditioning variable X.  If specified as integer vector of length zero or left unspecified, the unconditional density is returned.}
 \item{X.given}{a vector of reals denoting the conditioning value of X. This should be of the same length as \code{given.ind}}
 \item{check.sigma}{logical; if \code{TRUE}, the variance-covariance matrix is checked for appropriateness (symmetry, positive-definiteness). This could be set to FALSE if the user knows it is appropriate.}
}

\seealso{\code{\link{dcmvnorm}}, \code{\link{pcmvnorm}}, \code{\link{pmvnorm}}, \code{\link{dmvnorm}}, \code{\link{qmvnorm}}}
\examples{
# 10-dimensional multivariate normal distribution
n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A \%*\% t(A)

condMVN(mean=rep(1,n), sigma=A, dependent=c(2,3,5), given=c(1,4,7,9),
  X.given=c(1,1,0,-1))

condMVN(mean=rep(1,n), sigma=A, dep=3, given=c(1,4,7,9), X=c(1,1,0,-1))

condMVN(mean=rep(1,n), sigma=A, dep=3, given=integer())  
# or simply the following

condMVN(mean=rep(1,n), sigma=A, dep=3)  

}
\keyword{distribution}
\keyword{multivariate}
