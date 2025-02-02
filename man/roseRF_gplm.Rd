% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/main.R
\name{roseRF_gplm}
\alias{roseRF_gplm}
\title{ROSE random forest estimator for the generalised partially linear model}
\usage{
roseRF_gplm(
  y_on_xz_formula,
  y_on_xz_learner,
  y_on_xz_pars = list(),
  Gy_on_z_formula,
  Gy_on_z_learner,
  Gy_on_z_pars = list(),
  x_formula,
  x_learner,
  x_pars = list(),
  M1_formula = x_formula,
  M1_learner = x_learner,
  M1_pars = x_pars,
  M2_formula = NA,
  M2_learner = NA,
  M2_pars = list(),
  M3_formula = NA,
  M3_learner = NA,
  M3_pars = list(),
  M4_formula = NA,
  M4_learner = NA,
  M4_pars = list(),
  M5_formula = NA,
  M5_learner = NA,
  M5_pars = list(),
  link = "identity",
  data,
  K = 5,
  S = 1,
  max.depth = 10,
  num.trees = 500,
  min.node.size = max(10, ceiling(0.01 * (K - 1)/K * nrow(data))),
  replace = TRUE,
  sample.fraction = 0.8
)
}
\arguments{
\item{y_on_xz_formula}{a two-sided formula object describing the model for \eqn{\mathbb{E}[Y|X,Z]} (regressing \eqn{Y} on \eqn{(X)}).}

\item{y_on_xz_learner}{a string specifying the regression method to fit the regression as given by \code{y_on_xz_formula} (e.g. \code{randomforest, xgboost, neuralnet, gam}).}

\item{y_on_xz_pars}{a list containing hyperparameters for the \code{y_on_xz_learner} chosen. Default is an empty list, which performs hyperparameter tuning.}

\item{Gy_on_z_formula}{a two-sided formula object describing the model for \eqn{\mathbb{E}[g(\mathbb{E}[Y|X,Z])|Z]} (regressing \eqn{g(\hat{E}[Y|X,Z])} on \eqn{Z}).}

\item{Gy_on_z_learner}{a string specifying the regression method to fit the regression as given by \code{Gy_on_z_formula} (e.g. \code{randomforest, xgboost, neuralnet, gam}).}

\item{Gy_on_z_pars}{a list containing hyperparameters for the \code{Gy_on_z_learner} chosen. Default is an empty list, which performs hyperparameter tuning.}

\item{x_formula}{a two-sided formula object describing the model for \eqn{\mathbb{E}[X|Z]}.}

\item{x_learner}{a string specifying the regression method to fit the regression of \eqn{X} on \eqn{Z} as given by \code{x_formula} (e.g. \code{randomforest, xgboost, neuralnet, gam}).}

\item{x_pars}{a list containing hyperparameters for the \code{x_learner} chosen. Default is an empty list, which performs hyperparameter tuning.}

\item{M1_formula}{a two-sided formula object for the model \eqn{\mathbb{E}[M_1(X)|Z]}. Default is \eqn{M_1(X)=X}.}

\item{M1_learner}{a string specifying the regression method for \eqn{\mathbb{E}[M_1(X)|Z]} estimation.}

\item{M1_pars}{a list containing hyperparameters for the \code{M1_learner} chosen.}

\item{M2_formula}{a two-sided formula object for the model \eqn{\mathbb{E}[M_2(X)|Z]}. Default is no formula / regression (i.e. \eqn{J=1})}

\item{M2_learner}{a string specifying the regression method for \eqn{\mathbb{E}[M_2(X)|Z]} estimation.}

\item{M2_pars}{a list containing hyperparameters for the \code{M2_learner} chosen.}

\item{M3_formula}{a two-sided formula object for the model \eqn{\mathbb{E}[M_3(X)|Z]}. Default is no formula / regression (i.e. \eqn{J=1}).}

\item{M3_learner}{a string specifying the regression method for \eqn{\mathbb{E}[M_3(X)|Z]} estimation.}

\item{M3_pars}{a list containing hyperparameters for the \code{M3_learner} chosen.}

\item{M4_formula}{a two-sided formula object for the model \eqn{\mathbb{E}[M_4(X)|Z]}. Default is no formula / regression (i.e. \eqn{J=1})}

\item{M4_learner}{a string specifying the regression method for \eqn{\mathbb{E}[M_4(X)|Z]} estimation.}

\item{M4_pars}{a list containing hyperparameters for the \code{M4_learner} chosen.}

\item{M5_formula}{a two-sided formula object for the model \eqn{\mathbb{E}[M_5(X)|Z]}. Default is no formula / regression (i.e. \eqn{J=1})}

\item{M5_learner}{a string specifying the regression method for \eqn{\mathbb{E}[M_5(X)|Z]} estimation.}

\item{M5_pars}{a list containing hyperparameters for the \code{M5_learner} chosen.}

\item{link}{link function (\eqn{g}). Options include \code{identity}, \code{log}, \code{sqrt}, \code{logit}, \code{probit}. Default is \code{identity}.}

\item{data}{a data frame containing the variables for the partially linear model.}

\item{K}{the number of folds used for \eqn{K}-fold cross-fitting. Default is 5.}

\item{S}{the number of repeats to mitigate the randomness in the estimator on the sample splits used for \eqn{K}-fold cross-fitting. Default is 5.}

\item{max.depth}{Maximum depth parameter used for ROSE random forests. Default is 5.}

\item{num.trees}{Number of trees used for a single ROSE random forest. Default is 50.}

\item{min.node.size}{Minimum node size of a leaf in each tree. Default is \code{max(10,ceiling(0.01 (K-1)/K nrow(data)))}.}

\item{replace}{Whether sampling for a single random tree are performed with (bootstrap) or without replacement. Default is \code{TRUE} (i.e. bootstrap).}

\item{sample.fraction}{Proportion of data used for each random tree. Default is 0.8.}
}
\value{
A list containing:
  \describe{
    \item{\code{theta}}{The estimator of \eqn{\theta_0}.}
    \item{\code{stderror}}{Huber robust estimate of the standard error of the \eqn{\theta_0}-estimator.}
    \item{\code{coefficients}}{Table of \eqn{\theta_0} coefficient estimator, standard error, z-value and p-value.}
  }
}
\description{
Estimates the parameter of interest \eqn{\theta_0} in the generalised partially linear model
\deqn{g(\mathbb{E}[Y|X,Z]) = X\theta_0 + f_0(Z),} for some (strictly increasing, differentiable) link function \eqn{g}, which can be reposed in terms of
the `nuisance functions' \eqn{(\mathbb{E}[X|Z], \mathbb{E}[g(\mathbb{E}[Y|X,Z])|Z])} as \deqn{g\big(\mathbb{E}[Y|X,Z])-\mathbb{E}[g(\mathbb{E}[Y|X,Z])|Z]\big) = (X-\mathbb{E}[X|Z])\theta_0.}
}
\details{
The estimator of interest \eqn{\theta_0} solves the estimating equation
\deqn{\sum_{i}\psi(Y_i,X_i,Z_i; \theta,\hat{\eta}(Z),\hat{w}(Z)) = 0,}
\deqn{\psi(Y,X,Z;\theta,\eta_0,w) := \sum_{j=1}^J w_j(Z) \big( M_j(X) - \mathbb{E}[M_j(X)|Z] \big) g'(\mu(X,Z;\theta,\eta_0)) \big(Y-\mu(X,Z;\theta,\eta_0)\big) ,}
\deqn{\mu(X,Z;\theta,\eta_0) := g^{-1}\big(\mathbb{E}[g(\mathbb{E}[Y|X,Z])|Z] + (X-\mathbb{E}[X|Z])\theta\big),}
\deqn{\eta_0 := \big(\mathbb{E}[Y|Z=\cdot], \mathbb{E}[X|Z=\cdot]\big),}
where \eqn{M_1(X),\ldots,M_J(X)} denotes user-chosen functions of \eqn{(X)}
and \eqn{w(Z)=\big(w_1(Z),\ldots,w_J(Z)\big)} denotes weights estimated via ROSE random forests.
The default takes \eqn{J=1} and \eqn{M_1(X)=X}; if taking \eqn{J\geq 2} we recommend care
in checking the applicability and appropriateness of any additional user-chosen
regression tasks.

The parameter of interest \eqn{\theta_0} is estimated using a DML2 / \eqn{K}-fold cross-fitting
framework, to allow for arbitrary (faster than \eqn{n^{1/4}}-consistent) learners for \eqn{\hat{\eta}} i.e. solving
the estimating equation
\deqn{\sum_{k \in [K]}\sum_{i \in I_k}\psi(Y_i,X_i,Z_i; \theta,\hat{\eta}^{(k)}(Z),\hat{w}^{(k)}(Z)) = 0,}
where \eqn{I_1,\ldots,I_K} denotes a partition of the index set for the datapoints \eqn{(Y_i,X_i,Z_i)},
\eqn{\hat{\eta}^{(k)}} denotes an estimator for \eqn{\eta_0} trained on the data indexed by
\eqn{I_k^c}, and \eqn{\hat{w}^{(k)}} denotes a ROSE random forest (again trained on the data
indexed by \eqn{I_k^c}).
}
