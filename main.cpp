#include "dlib/optimization.h"
#include "dlib/matrix.h"
#include <tr1/memory>
#include "matio.h"
#include <iostream>
#include "collaborativeFiltering.h"
#include "mysql_driver.h";
#include "mysql_connection.h";
#include "cppconn/prepared_statement.h"

using std::cout;
using std::endl;
using dlib::matrix;
using dlib::matrix_exp;
using dlib::randm;
using std::tr1::shared_ptr;
using com_firfi::GDFunc;
using dlib::crop_cols;
using std::vector;
using std::pair;
using std::map;

typedef shared_ptr<matrix<double> > matrix_ptr;
typedef shared_ptr<const matrix<double> > matrix_ptr_const;

namespace com_firfi {

matrix<double> matvar_to_matrix(matvar_t* matvar) {
	matrix<double> result;
	result.set_size(matvar->dims[0], matvar->dims[1]);
	for (int i = 0; i < matvar->dims[0]; i++) {
		for (int j = 0; j < matvar->dims[1]; j++) {
            switch(matvar->class_type) {
                case MAT_C_DOUBLE :
                    result(i,j) = ((double*)matvar->data)[matvar->dims[0]*j+i];
                    break;
                case MAT_C_UINT8 :
                    result(i,j) = ((uint8_t*)matvar->data)[matvar->dims[0]*j+i];
                    break;
                default :
                    cout << "error in null pointer type conversion; matvar class type : " << matvar->class_type << endl;
                    break;
            }
		}
	}
	return result;
}

struct comp {
  bool operator() (const std::pair<int, double>& i,const std::pair<int, double>& j) { return (i.second<j.second);}
} comp;
}



int main(int arccount, char** args) {
	cout << time(NULL) << endl;
	mat_t* mat;
	matvar_t* Ymat;
	//matvar_t* Rmat;
	matrix<double> Y;
	matrix<double> R;
	matrix<double> X;
	matrix<double> Theta;
	mat = Mat_Open("./ex8_movies.mat",MAT_ACC_RDONLY);
	if(mat) {
		Ymat = Mat_VarReadNext(mat);
		using com_firfi::matvar_to_matrix;
		Y = matvar_to_matrix(Ymat);
		//Rmat = Mat_VarReadNext(mat);
		//R = matvar_to_matrix(Rmat);
	}
	matrix<double> myY;
	myY.set_size(Y.nr(),1);
	Y.set_size(Y.nr(), Y.nc()+1);
	set_colm(Y,Y.nc()-1) = 0;
	myY(0,0) = 4;
	myY(97,0) = 2;
	myY(6,10) = 4;
	myY(11,0) = 5;
	myY(53,0) = 4;
	myY(63,0) = 5;
	myY(65,0)= 3;
	myY(68,0) = 5;
	myY(182,0) = 4;
	myY(225,0) = 5;
	myY(354,0) = 5;
	set_colm(Y,Y.nc() - 1) = myY;

	int num_features = 10;
	long num_users = Y.nc();
	long num_movies= Y.nr();
	
	matrix<double,0,1> GDArgs = 
			dlib::join_cols(
						dlib::reshape_to_column_vector(randm(num_movies, num_features)),
						dlib::reshape_to_column_vector(randm(num_users, num_features))
						);
	double min_delta = 1e-7; int max_iter = 50; int fine_cost = 500;
	double lambda = 10;
	com_firfi::GDFunc<matrix<double> > func(Y,R,lambda,num_movies,num_users,num_features);
	com_firfi::GDDer<matrix<double> > der(func);
	dlib::objective_delta_stop_strategy stop_strategy(min_delta, max_iter);
	dlib::find_min(dlib::lbfgs_search_strategy(20), stop_strategy, func,
		der, GDArgs, fine_cost);
	X = dlib::munfold(GDArgs, 0, num_movies, num_features);
	Theta = dlib::munfold(GDArgs, num_movies * num_features, num_users, num_features);
	matrix<double> predictedY = X * trans(Theta);
	for (long i = 0; i< predictedY.nr(); ++i) {
		for (long j = 0;j< predictedY.nc(); ++j) {
			if (Y(i,j) != 0) predictedY(i,j) = 0;
		}
	}
	typedef std::vector<std::multimap<double, int, std::greater<double> > > recommends;
	recommends r = com_firfi::mostRecommend(predictedY,10);
	for (recommends::iterator it = r.begin(); it != r.end(); ++it) {
		typedef std::multimap<double, int, std::greater<double> >::iterator mit;
		for (mit mit = it->begin(); mit != it->end(); ++mit) {
			cout << mit->first << " " << mit->second + 1 << "; ";
		}
		cout << endl;
	}
	cout << time(NULL) << endl;
}
