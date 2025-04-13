\name{pcmvnorm}
\alias{pcmvnorm}
\title{ Conditional Multivariate Normal Distribution }
\description{

Computes the distribution function of the conditional multivariate normal, [Y given X], where Z = (X,Y) is the fully-joint multivariate normal distribution with mean equal to \code{mean} and covariance matrix \code{sigma}.

}
\usage{
pcmvnorm(lower=-Inf, upper=Inf, mean, sigma, 
	dependent.ind, given.ind, X.given, 
	check.sigma=TRUE, algorithm = GenzBretz(), ...)
}
\arguments{
  \item{lower}{ the vector of lower limits of length n.}
  \item{upper}{ the vector of upper limits of length n.}
  \item{mean}{ the mean vector of length n.}
 \item{sigma}{a symmetric, positive-definte matrix, of dimension n x n, which must be specified.}
 \item{dependent.ind}{a vector of integers denoting the indices of the dependent variable Y.}
 \item{given.ind}{a vector of integers denoting the indices of the conditioning variable X. If specified as integer vector of length zero or left unspecified, the unconditional distribution is used.}
 \item{X.given}{a vector of reals denoting the conditioning value of X. This should be of the same length as \code{given.ind}}
  \item{check.sigma}{logical; if \code{TRUE}, the variance-covariance matrix is checked for appropriateness (symmetry, positive-definiteness). This could be set to FALSE if the user knows it is appropriate.}
 \item{algorithm}{ an object of class \code{\link[mvtnorm]{GenzBretz}},
                    \code{\link[mvtnorm]{Miwa}} or \code{\link[mvtnorm]{TVPACK}}
                    specifying both the algorithm to be used as well as 
                    the associated hyper parameters.}
  \item{...}{ additional parameters (currently given to \code{GenzBretz} for 
              backward compatibility issues). }
}
\details{

This program involves the computation of 
multivariate normal probabilities with arbitrary correlation matrices.

 
}
\value{
The evaluated distribution function is returned with attributes
  \item{error}{estimated absolute error and}
  \item{msg}{status messages.}
}

\seealso{\code{\link{dcmvnorm}}, \code{\link{rcmvnorm}}, \code{\link[mvtnorm]{pmvnorm}}.}

\examples{
n <- 10
A <- matrix(rnorm(n^2), n, n)
A <- A \%*\% t(A)

pcmvnorm(lower=-Inf, upper=1, mean=rep(1,n), sigma=A, 	dependent.ind=3, 
  given.ind=c(1,4,7,9,10), X.given=c(1,1,0,0,-1))

pcmvnorm(lower=-Inf, upper=c(1,2), mean=rep(1,n), sigma=A, 
  dep=c(2,5), given=c(1,4,7,9,10), X=c(1,1,0,0,-1))

pcmvnorm(lower=-Inf, upper=c(1,2), mean=rep(1,n), sigma=A, 
	dep=c(2,5))

}
\keyword{distribution}
\keyword{multivariate}
